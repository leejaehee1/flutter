import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import '/globals/login.dart' as login;
import '/globals/issue.dart' as issue;
import '/globals/globals.dart' as globals;
// import '../punch_screen.dart';

class ConfirmButton extends StatefulWidget {
  ConfirmButton(
      {Key? key,
      // required this.name,
      required this.buttonname1,
      required this.buttonname2,
      required this.buttonname3})
      : super(key: key);
  // String name;
  final String buttonname1;
  final String buttonname2;
  final String buttonname3;

  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  var api = dotenv.env['PHONE_IP'];
  // var api = dotenv.env['EMUL_IP'];
  var buttonWidth = Get.width * 1 / 3.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff71838D),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(widget.buttonname1),
            ),
          ),
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff71838D),
              ),
              onPressed: () {
                _showDialog('/home');
              },
              child: Text(widget.buttonname2),
            ),
          ),
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff2F4C5A), // background
                // onPrimary: Colors.white, // foreground
              ),
              onPressed: () async {
                print('hi');
                var url = Uri.parse('$api/summury/confirm');

                await http.post(url, body: {
                  'projectID': issue.projectList[0],
                  'punchID': globals.punch_issue_Punch_ID[0],
                  'category': globals.punch_issue_Category.length == 0
                      ? 'null'
                      : globals.punch_issue_Category[0],
                  'systemID': globals.punch_issue_System.length == 0
                      ? 'null'
                      : globals.punch_issue_System[0],
                  'subsystem': globals.punch_issue_Sub_System.length == 0
                      ? 'null'
                      : globals.punch_issue_Sub_System[0],
                  'discipline': globals.punch_issue_Discipline.length == 0
                      ? 'null'
                      : globals.punch_issue_Discipline[0],
                  'status': globals.punch_issue_Status.length == 0
                      ? 'null'
                      : globals.punch_issue_Status[0],
                  'unit': globals.punch_issue_Unit.length == 0
                      ? 'null'
                      : globals.punch_issue_Unit[0],
                  'area': globals.punch_issue_Area.length == 0
                      ? 'null'
                      : globals.punch_issue_Area[0],
                  'tagNumber': globals.punch_issue_Tag_Number.length == 0
                      ? 'null'
                      : globals.punch_issue_Tag_Number[0],
                  'bulkItem': globals.punch_issue_Bulk_Item.length == 0
                      ? '0'
                      : globals.punch_issue_Bulk_Item[0],
                  'department': globals.punch_issue_Action_On.length == 0
                      ? 'null'
                      : globals.punch_issue_Action_On[0],
                  'targetDate': globals.punch_issue_Date.length == 0
                      ? DateTime.now()
                      : globals.punch_issue_Date[0].toString(),
                  'raisedBy': globals.punch_issue_Raised_On.length == 0
                      ? 'null'
                      : globals.punch_issue_Raised_On[0],
                  'designChgReq': globals.punch_issue_Design.length == 0
                      ? 'null'
                      : globals.punch_issue_Design[0],
                  'materialReq': globals.punch_issue_Material.length == 0
                      ? 'null'
                      : globals.punch_issue_Material[0],
                  'issueDescription':
                      globals.punch_issue_Description.length == 0
                          ? 'null'
                          : globals.punch_issue_Description[0],
                  'keyword1': globals.punch_issue_Keyword.length == 0
                      ? 'null'
                      : globals.punch_issue_Keyword[0],
                  // 'keyword2': globals.punch_issue_Keyword.length == 2
                  //     ? ''null''
                  //     : globals.punch_issue_Keyword[1],
                  // 'keyword3': globals.punch_issue_Keyword.length == 3
                  //     ? ''null''
                  //     : globals.punch_issue_Keyword[2],
                  // 'keyword4': globals.punch_issue_Keyword.length == 4
                  //     ? ''null''
                  //     : globals.punch_issue_Keyword[3],
                });
                print('보낸다!!!!!!!!');

                // var url2 = Uri.parse('$api/summury/photos');
                // await http.post(url2, body: {
                //   if (globals.punch_issue_Photo_Path.length == 1)
                //     {
                //       'punchID': globals.punch_issue_Punch_ID[0].length == 0
                //           ? 'punchtest'
                //           : globals.punch_issue_Punch_ID[0],
                //       'punchStep': '1',
                //       'seq': ' 1',
                //       'localPath': '${globals.punch_issue_Photo_Path[0]}',
                //       'imagePath': globals.punch_issue_Photo_Name[0].toString(),
                //       'uploaded':
                //           globals.punch_issue_Switch == true ? '1' : '0',
                //       'uploadDate': DateTime.now().toString(),
                //     }
                //   else if (globals.punch_issue_Photo_Path.length > 1)
                //     {
                //       for (var i = 0;
                //           i < globals.punch_issue_Photo_Path.length;
                //           i++)
                //         {
                //           'punchID': globals.punch_issue_Punch_ID[0].length == 0
                //               ? 'punchtest'
                //               : globals.punch_issue_Punch_ID[0],
                //           'punchStep': '1',
                //           'seq': '${i + 1}',
                //           'localPath': '${globals.punch_issue_Photo_Path[i]}',
                //           'imagePath':
                //               globals.punch_issue_Photo_Name[i].toString(),
                //           'uploaded':
                //               globals.punch_issue_Switch == true ? '1' : '0',
                //           'uploadDate': DateTime.now().toString(),
                //         }
                //     }
                //   else
                //     {}
                // });

                print('간다!!!!!!!!!!!!!!!!!!!');

                Get.offAllNamed("/success");
              },
              child: Text(widget.buttonname3),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(String page) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(
              "Are you sure you want to Cancel? \n Changes that you made may not be saved"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D),
                  ),
                  child: new Text("No"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2F4C5A), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  child: new Text("Yes"),
                  onPressed: () {
                    setState(() {});
                    Get.toNamed(page);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
