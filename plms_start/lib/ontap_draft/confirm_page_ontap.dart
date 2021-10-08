import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:plms_start/pages/utils/button_confirm.dart';
import 'package:plms_start/pages/utils/header_issue.dart';

import '../globals/globals.dart' as globals;
import '../globals/punch_draft.dart' as draft;
import 'button_confirm_ontap.dart';
// import '../globals/issue.dart' as issue;

// import 'components/screenList.dart';

class OnTapConfirmPage extends StatefulWidget {
  @override
  _OnTapConfirmPageState createState() => _OnTapConfirmPageState();
}

class _OnTapConfirmPageState extends State<OnTapConfirmPage> {
  // String punchID = 'punchID';

  // String date = 'date';

  // String issuedBy = 'issuedBy';
  // String unit = 'unit';
  // String area = 'area';
  // String system = 'system';
  // String subsystem = 'subsystem';
  // String tagnumber = 'tagnumber';
  // String category = 'category';
  String punchID = draft.punch_issue_Punch_ID[0];
  String date =
      draft.punch_issue_Date.length == 0 ? 'date' : draft.punch_issue_Date[0];
  String issuedBy = draft.punch_issue_Raised_On.length == 0
      ? 'issuedBy'
      : draft.punch_issue_Raised_On[0];
  String unit =
      draft.punch_issue_Unit.length == 0 ? 'unit' : draft.punch_issue_Unit[0];
  String area =
      draft.punch_issue_Area.length == 0 ? 'area' : draft.punch_issue_Area[0];
  String system = draft.punch_issue_System[0];

  String subsystem = draft.punch_issue_Sub_System[0];

  String tagnumber = draft.punch_issue_Tag_Number.length == 0
      ? 'tagnumber'
      : draft.punch_issue_Tag_Number[0];

  String category = draft.punch_issue_Category[0];
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
                                    // height: Get.height * 2.3 / 9,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Column(
                                      children: [
                                        _rowData2('Unit', unit),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2('Area', area),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2(
                                          'System',
                                          system,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2('Sub-system', subsystem),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2(
                                          'Tag Number',
                                          tagnumber,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _rowData2('Category', category),
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
      bottomNavigationBar: OnTapConfirmButton(

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

  Widget _rowData2(var title1, var data1) {
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
      ],
    );
  }
}
