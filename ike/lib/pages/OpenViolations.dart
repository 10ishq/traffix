import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List urlList = [];
int len = 0;

class OpenV extends StatefulWidget {
  @override
  _OpenVState createState() => _OpenVState();
}

class _OpenVState extends State<OpenV> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviewed Violations"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: urlList.length,
        itemBuilder: (BuildContext ctx, int index) {
          return SizedBox(
            height: size.height * 1.2,
            width: size.width / 3,
            child: Padding(
              padding: const EdgeInsets.all(100),
              child: Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                elevation: 50,
                child: Image(
                  image: NetworkImage(urlList[index]),
                ),
              ),
            ),
          );
          print('===================');
          print(urlList[index]);
        },
      ),
    );
  }
}

getUrl() async {
  int nImages = 0;

  var abc = await FirebaseFirestore.instance
      .collection('images')
      .where('isReviewed', isEqualTo: true)
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              urlList.add(doc['url']);
              print(doc['url']);
            })
          });
  len = urlList.length;
  print('length=');
  print(len);

  print(abc);
}
