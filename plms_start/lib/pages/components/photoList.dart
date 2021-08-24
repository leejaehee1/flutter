import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:plms_start/pages/utils/button_issue.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

import 'List_file.dart';

// import 'screen_punch.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({Key? key}) : super(key: key);

  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B3745),
        automaticallyImplyLeading: false,
        title: Header(title: "title"),
      ),
      body: DefaultTabController(
        // initialIndex: 0,
        length: 5,
        child: Column(
          children: [
            Container(
              color: Color(0xFFE6E6E6),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                child: Container(
                    color: Color(0xff2B3745),
                    height: 30,
                    child: Text(
                      'Please connect to WIFI and Upload',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListFile(),
                  ListFile(),
                  ListFile(),
                  ListFile(),
                  ListFile(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff2F4C5A), // background
          // onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          Get.offAllNamed('/home');
        },
        child: Text("Upload"),
      ),
    );
  }
}
