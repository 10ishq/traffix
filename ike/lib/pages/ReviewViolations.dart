import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'List_of_Violations.dart';
import 'package:ike/main.dart';
import 'HomePage.dart';

class ReviewV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyImage();
  }
}

class MyImage extends StatefulWidget {
  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  bool reviewFlag = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('hellomf*********************');

    return Scaffold(
        appBar: AppBar(
          title: Text("Currently Reviewing Images"),
          centerTitle: true,
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: size.width / 4.5,
                height: size.height / 1.3,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Allow', textScaleFactor: 4),
                  elevation: 50,
                  color: Colors.green,
                  onPressed: () async {
                    isApproved = true;
                    isReviewed = true;
                    await updateReviewAV();
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => LoV()));
                  },
                )),
            Image(
              image: NetworkImage(url),
              height: size.height / 1.3,
              width: size.width / 1.9,
            ),
            SizedBox(
                width: size.width / 4.5,
                height: size.height / 1.3,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Discard', textScaleFactor: 4),
                  elevation: 50,
                  color: Colors.red,
                  onPressed: () async {
                    isReviewed = true;
                    await updateReviewAV();
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => HomeP()));
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )
          ],
        )));
  }
}

updateReviewAV() async {
  await FirebaseFirestore.instance
      .collection("images")
      .doc(documentID)
      .update({
        'isReviewed': isReviewed,
        'isApproved': isApproved,
        'KPoints': KPoints
      })
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
