import 'package:flutter/material.dart';

import 'package:delayed_display/delayed_display.dart';
import 'package:get/get.dart';
// import 'package:plms_start/screens/utils/swich_punch.dart';
// import 'utils/draft_screen.dart';
import 'utils/image_picker.dart';
import 'utils/title_text.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(10);
    return Container(
      color: Color(0xFFE6E6E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffB7C5B9),
                borderRadius:
                    BorderRadius.only(topLeft: radius, bottomLeft: radius),
              ),
              height: MediaQuery.of(context).size.height,
              width: Get.width * 1 / 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: Get.width - Get.width * 0.83 / 8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topRight: radius, bottomRight: radius),
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
                  children: [
                    // DropboxText(text: 'Action On'),
                    Row(
                      children: [
                        TitleText(
                          title: 'Attachment',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ImagePickers(),
                    Container(
                      height: MediaQuery.of(context).size.height - 305,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('View drawing'),
                              Container(
                                width: Get.width * 1 / 4.1,
                                height: Get.height * 1 / 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xff8ab898)),
                                  onPressed: () {
                                    // FileImage();
                                  },
                                  child: Text(
                                    "Location",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                              // Text(pixelList),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onDoubleTap: () {
                              setState(() {
                                Get.toNamed("/draft");
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.width - 90,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: Image.asset(
                                  "assets/images/punch_draft_sample.jpg"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
