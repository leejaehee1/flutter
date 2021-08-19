import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/utils/header_issue.dart';
import 'package:plms_start/screens/utils/image_picker.dart';
import 'package:plms_start/screens/utils/swich_punch.dart';
import 'package:plms_start/screens/utils/title_text.dart';

class PunchComplete extends StatefulWidget {
  const PunchComplete({Key? key}) : super(key: key);

  @override
  _PunchCompleteState createState() => _PunchCompleteState();
}

class _PunchCompleteState extends State<PunchComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(
            child: Container(
              color: Color(0xFFE6E6E6),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 1 / 7,
                // width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                child: Container(
                    color: Color(0xff2B3745),
                    height: 30,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'aaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'aaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'aaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'aaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'aaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'aaaa',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Comment of Not Accepted")
                      ],
                    )),
              ),
            ),
          ),
          Container(
            color: Color(0xFFE6E6E6),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffB7C5B9),
                      offset: Offset(-7, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
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
                      SizedBox(
                        height: 20,
                      ),
                      // _description(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _description() {
    return Column(
      children: [
        Row(
          children: [
            Text("Description"),
          ],
        ),
        Container(
          height: 100,
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLength: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "hint",
                isDense: true,
              )),
        ),
      ],
    );
  }
}
