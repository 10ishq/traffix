import 'package:flutter/material.dart';
import 'package:ike/pages/OpenViolations.dart';
import 'package:ike/main.dart';
import 'ReviewViolations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'OpenViolations.dart';

String url = '';
int KPoints = 0;
bool isApproved = false;
bool isReviewed = false;
String documentID = '';

class HomeP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TRAFFIX'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width / 2.5,
                height: size.height / 1.5,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Review Violations', textScaleFactor: 4),
                  elevation: 50,
                  onPressed: () async {
                    await getLatestReview();

                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => ReviewV()));
                  },
                ),
              ),
              SizedBox(
                width: 20.0,
                height: 20.0,
              ),
              SizedBox(
                width: size.width / 2.5,
                height: size.height / 1.5,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Open Violations', textScaleFactor: 4),
                  elevation: 50,
                  onPressed: () async {
                    await getUrl();
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => OpenV()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

getLatestReview() async {
  var dat = await FirebaseFirestore.instance
      .collection('images')
      .where('isReviewed', isEqualTo: false)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              isApproved = doc["isApproved"];
              isReviewed = doc["isReviewed"];
              KPoints = doc["KPoints"];
              url = doc["url"];
              documentID = doc.id;
              print(doc["isApproved"]);
              print(doc.id);
              print(doc["isReviewed"]);
              print(doc["url"]);
            })
          });
  print('$dat');
}
