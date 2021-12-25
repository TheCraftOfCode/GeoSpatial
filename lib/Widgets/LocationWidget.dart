import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geo_spatial/Utils/Colors.dart' as colors;

/**
 * Form Widget to get current location with validation
 */

class LocationWidgetField extends FormField<Position> {
  LocationWidgetField(
      {FormFieldSetter<Position>? onSaved,
      FormFieldValidator<Position>? validator,
      Position? defaultValue,
      required BuildContext context,
      required String title,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null) return "Location field empty";
                  return null;
                },
            initialValue: defaultValue,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<Position> state) {
              return Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(title,
                            style: GoogleFonts.montserrat(
                                fontSize: 25, color: Colors.white)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: state.hasError
                              ? Border.all(width: 1, color: Colors.red)
                              : Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 194, 194, 194)),
                          color: state.hasError
                              ? colors.errorColor
                              : Color.fromARGB(255, 238, 238, 238),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: state.hasError
                                ? Text(
                                    state.errorText ?? "error",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 10),
                                  )
                                : Text(
                                    state.value != null
                                        ? state.value.toString()
                                        : "Please fetch your location",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        child: ElevatedButton(
                          onPressed: () async {
                            _determinePosition(context).then((value) {
                              state.didChange(value);
                            }).catchError((onError, stackTrace) {
                              print("inner: $onError");
                              state.didChange(null);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(onError),
                              ));
                            });
                          },
                          child: Text('Get location'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50)),
                        ),
                      ),
                    ],
                  ));
            });
}

Future<Position> _determinePosition(context) async {
  bool serviceEnabled;
  LocationPermission permission;
  BuildContext? progressContext;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error(
        'Location services are disabled, try enabling location in your device');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, permission cannot be requested.');
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      progressContext = context;
      return WillPopScope(
          child: Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: CircularProgressIndicator(),
                  ),
                  new Text(
                    "Fetching Location",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          onWillPop: () async => false);
    },
  );

  var location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);

  Navigator.of(progressContext!, rootNavigator: true).pop();
  return location;
}
