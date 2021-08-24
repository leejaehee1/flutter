import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/complete_component.dart';
import 'package:plms_start/pages/utils/header_issue.dart';
import 'package:plms_start/screens/utils/image_picker.dart';
// import 'package:plms_start/screens/utils/swich_punch.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xff2B3745),
        automaticallyImplyLeading: false,
        title: Header(
          title: "title",
        ),
      ),
      body: DefaultTabController(
        // initialIndex: 0,
        length: 1,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1.45 / 7,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFE6E6E6),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  color: Color(0xff2B3745),
                  // height: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CompleteComponent(),
                        CompleteComponent(),
                        CompleteComponent(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 500,
                          child: Divider(
                            color: Color(0xff5D8791),
                            thickness: 1.3,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Comment of Not Accepted",
                              style: TextStyle(color: Color(0xff5D8791)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
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
                              _description(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
