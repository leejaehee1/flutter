import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:plms_start/pages/utils/button_confirm.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

import '../globals/globals.dart' as globals;
// import '../globals/issue.dart' as issue;

// import 'components/screenList.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  // String punchID = 'punchID';

  // String date = 'date';

  // String issuedBy = 'issuedBy';
  // String unit = 'unit';
  // String area = 'area';
  // String system = 'system';
  // String subsystem = 'subsystem';
  // String tagnumber = 'tagnumber';
  // String category = 'category';
  String punchID = globals.punch_issue_Punch_ID.length == 0
      ? 'punchID'
      : globals.punch_issue_Punch_ID[0];
  String date = globals.punch_issue_Date.length == 0
      ? 'date'
      : globals.punch_issue_Date[0];
  String issuedBy = globals.punch_issue_Action_On.length == 0
      ? 'issuedBy'
      : globals.punch_issue_Action_On[0];
  String unit = globals.punch_issue_Unit.length == 0
      ? 'unit'
      : globals.punch_issue_Unit[0];
  String area = globals.punch_issue_Area.length == 0
      ? 'area'
      : globals.punch_issue_Area[0];
  String system = globals.punch_issue_System.length == 0
      ? 'system'
      : globals.punch_issue_System[0];
  String subsystem = globals.punch_issue_Sub_System.length == 0
      ? 'subsystem'
      : globals.punch_issue_Sub_System[0];
  String tagnumber = globals.punch_issue_Tag_Number.length == 0
      ? 'tagnumber'
      : globals.punch_issue_Tag_Number[0];
  String category = globals.punch_issue_Category.length == 0
      ? 'category'
      : globals.punch_issue_Category[0];
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(10);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: "Punch Issue",
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 4 / 7,
                color: Color(0xFFE6E6E6),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffB7C5B9),
                              borderRadius: BorderRadius.only(
                                  topLeft: radius, bottomLeft: radius),
                            ),
                            height:
                                MediaQuery.of(context).size.height * 6.9 / 9,
                            width: Get.width * 1 / 50,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height:
                                MediaQuery.of(context).size.height * 6.9 / 9,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Punch Issue Confirmation",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  _sizedBox(),
                                  Text(
                                    "Plsease confirm created Punch Issue",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _rowData("Punch ID", punchID),
                                  _sizedBox(),
                                  _rowData("Issued Date", date),
                                  _sizedBox(),
                                  _rowData("Issued By", issuedBy),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: Get.height * 2.3 / 9,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Column(
                                      children: [
                                        _rowData2('Unit', unit, 'Area', area),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2('System', system,
                                            'Sub-system', subsystem),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2('Tag Number', tagnumber,
                                            'Category', category),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConfirmButton(

          // name: '/',
          buttonname1: "Back",
          buttonname2: "Cancel",
          buttonname3: "Confirm"),
    );
  }

  Widget _sizedBox() {
    return SizedBox(
      height: 5,
    );
  }

  Widget _rowData(var title, var data) {
    return Row(
      children: [
        SizedBox(
            width: Get.width * 2 / 7,
            child: Text(
              title,
              style: TextStyle(color: Colors.black54),
            )),
        Text(
          data,
        ),
      ],
    );
  }

  Widget _rowData2(var title1, var data1, var title2, var data2) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: Get.width * 2 / 7,
                child: Text(
                  title1,
                  style: TextStyle(color: Colors.grey),
                )),
            Text(
              data1,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              data2,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
