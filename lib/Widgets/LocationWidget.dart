import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/**
 * Form Widget to get current location with validation
 */

class LocationWidgetField extends FormField<Position> {
  LocationWidgetField(
      {FormFieldSetter<Position>? onSaved,
      FormFieldValidator<Position>? validator,
      required BuildContext context,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled})
      : super(
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data == null) return "Location field empty";
                  return null;
                },
            initialValue: null,
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<Position> state) {
              return Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: state.hasError
                              ? Border.all(width: 1, color: Colors.red)
                              : null,
                          color: state.hasError
                              ? Color.fromARGB(255, 255, 216, 216)
                              : Colors.white70,
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
                                : Text(state.value != null
                                    ? state.value.toString()
                                    : ""),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        child: ElevatedButton(
                          onPressed: () async {
                            _determinePosition().then((value) {
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

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

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

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  //You can set accuracy to high ig, that returns like 6 decimal points. Plenty enough to plot on maps
}
