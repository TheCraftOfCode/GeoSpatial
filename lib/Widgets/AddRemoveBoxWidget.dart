import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/**
 * Added a dataclass
 * To be modified later
 * Add required data fields to this class
 */

class IndividualUserData {

}

class AddRemoveBoxWidget extends StatefulWidget {
  const AddRemoveBoxWidget({Key? key}) : super(key: key);

  @override
  _AddRemoveBoxWidgetState createState() => _AddRemoveBoxWidgetState();
}

class _AddRemoveBoxWidgetState extends State<AddRemoveBoxWidget> {
  var listOfElements = [];

  @override
  Widget build(BuildContext context) {

    return
      Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add New User Information",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.black)),
                  IconButton(onPressed: (){
                    setState(() {
                      listOfElements.add(new IndividualUserData());
                    });
                  }, icon: Icon(
                    Icons.add
                  ))
                ],
              ),
              ListView.builder(
                    itemCount: listOfElements.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          onTap: (){
                            var obj = listOfElements[index]; //Modify this object
                          }, //Pass a function which is called onSaved in the next page and add data to the class object
                          leading: Icon(Icons.person),
                          title: Text("User ${index + 1}"),
                          trailing: IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                listOfElements.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    }),
            ],
    ),
          ),
        ),
      );
  }
}


