import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import 'package:plms_start/pages/utils/header_issue.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../globals/globals.dart' as globals;

// https://www.youtube.com/watch?v=eWhnXGjppHw

/*
* name : DraftPage
* description : draft page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class DraftPage2 extends StatefulWidget {
  @override
  _DraftPage2State createState() => _DraftPage2State();
}

class _DraftPage2State extends State<DraftPage2> {
  double _cdx = 0;
  double _cdy = 0;

  double get cdx => this._cdx;
  double get cdy => this._cdy;

  set cdx(double newCdx) => this._cdx = newCdx;
  set cdy(double newCdy) => this._cdy = newCdy;

  double boxWidth = 100.0;
  double boxHeight = 100.0;

  var pixelList = [];

  @override
  void initState() {
    Future.microtask(() {
      _cdx = 0;
      _cdy = 0;
    }).then((_) => setState(() {}));
    super.initState();
  }

  // 도면 좌표 찍기 화면
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(10);
    var buttonWidth = Get.width * 1 / 3.5;

    return Scaffold(

        // appBar: AppBar(
        //   backgroundColor: Color(0xff2B3745),
        //   automaticallyImplyLeading: false,
        //   title:
        // ),
        body: SafeArea(
          child: Container(
            color: Color(0xFFE6E6E6),
            child: Column(
              children: [
                Header(
                  title: "Select Location",
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 1.4 / 9,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFE6E6E6),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffB7C5B9),
                            borderRadius: BorderRadius.only(
                                topLeft: radius, bottomLeft: radius),
                          ),
                          height: MediaQuery.of(context).size.height * 1.4 / 9,
                          width: Get.width * 1 / 50,
                        ),
                        Container(
                          width: Get.width - Get.width * 0.83 / 8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: radius, bottomRight: radius),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffB7C5B9),
                                offset: Offset(0, 0.3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Category : ${globals.punch_issue_Category[0]}'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'System : ${globals.punch_issue_System[0]}'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Subsystem : ${globals.punch_issue_Sub_System[0]}')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 4 / 7,
                  color: Color(0xFFE6E6E6),
                  child: Listener(
                      onPointerDown: (PointerDownEvent event) {
                        setState(() {
                          Icon(Icons.add);
                        });

                        print('click');
                        print(event.transform);
                        print(event.position);
                      },
                      // onPointerMove: (PointerMoveEvent event) {
                      //   Icon(Icons.add);
                      //   print('click');
                      //   print(event);
                      // },
                      child: globals.punch_issue_Drawings_File.length == 1
                          ? Image.file(
                              globals.punch_issue_Drawings_File[0],
                              fit: BoxFit.fill,
                            )
                          : null),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 20),
          color: Color(0xFFE6E6E6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: buttonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color(0xff71838D), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel"),
                ),
              ),
              // Container(
              //   width: buttonWidth,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       padding: EdgeInsets.all(0),
              //       primary: Color(0xff5D8595), // background
              //       // onPrimary: Colors.white, // foreground
              //     ),
              //     onPressed: () {},
              //     child: Text("Clear Location"),
              //   ),
              // ),
              Container(
                width: buttonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Color(0xff2F4C5A), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    if (pixelList.length == 0) {
                      pixelList.add([this.cdx, this.cdy]);
                    } else {
                      pixelList.removeAt(0);
                      pixelList.add([this.cdx, this.cdy]);
                    }
                    print("pixelList: $pixelList");

                    print("pixelList: ${pixelList[0][1]}");
                    globals.punch_issue_Pixel_X = [];
                    globals.punch_issue_Pixel_Y = [];
                    globals.punch_issue_Pixel_X.add(pixelList[0][0]);
                    globals.punch_issue_Pixel_Y.add(pixelList[0][1]);
                    print(
                        "globals.punch_issue_Pixel: ${globals.punch_issue_Pixel_X}");
                    print(
                        "globals.punch_issue_Pixel: ${globals.punch_issue_Pixel_Y}");
                    // print(pixelList);
                  },
                  child: Text("Save Location"),
                ),
              ),
            ],
          ),
        ));
  }
}
