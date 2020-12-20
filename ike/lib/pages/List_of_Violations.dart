import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ike/pages/OpenViolations.dart';
import 'ReviewViolations.dart';
import 'HomePage.dart';

class LoV extends StatefulWidget {
  @override
  _LoVState createState() => _LoVState();
}

bool _tflight = false;
bool _zbc = false;
bool _park = false;
bool _wsd = false;
bool _fp = false;
bool _dd = false;
bool _rd = false;
bool _por = false;
bool _har = false;
String TypeofViolation = ' ';
List violation = [
  'Traffic Light Violation',
  'Zeebra Crossing Violation',
  'Parking Violaition',
  'Wrong Side Driving Violation',
  "Parking/Driving on Footpath Violation",
  'Rouge/Reckless/Drunk Driving',
  "Road Rage Violation",
  "Pedistrian Related Violation",
  "Hit and Run Violation"
];

class _LoVState extends State<LoV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          title: Text("Select Type of Violation"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckboxListTile(
                title: Text(violation[0]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _tflight,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[0];
                  setState(() {
                    _tflight = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[1]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _zbc,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[1];
                  setState(() {
                    _zbc = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[2]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _park,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[2];
                  setState(() {
                    _park = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[3]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _wsd,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[3];
                  setState(() {
                    _wsd = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[4]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _fp,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[4];
                  setState(() {
                    _fp = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[5]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _dd,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[5];
                  setState(() {
                    _dd = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[6]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _rd,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[6];
                  setState(() {
                    _rd = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[7]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _por,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[7];
                  setState(() {
                    _por = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(violation[8]),
                controlAffinity: ListTileControlAffinity.leading,
                value: _har,
                onChanged: (bool value) {
                  TypeofViolation += ' and ' + violation[8];
                  setState(() {
                    _har = value;
                  });
                },
              ),
              SizedBox(
                  width: 200,
                  height: 100,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('Submit', textScaleFactor: 4),
                      elevation: 50,
                      color: Colors.blue,
                      onPressed: () async {
                        await submitViolation();
                        await getUrl();
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => HomeP()));
                      }))
            ],
          ),
        ));
  }
}

submitViolation() async {
  await FirebaseFirestore.instance
      .collection("images")
      .doc(documentID)
      .update({'KPoints': KPoints + 5, 'TypeofViolation': TypeofViolation})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
