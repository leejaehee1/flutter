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

  // String projectID = issue.projectList[0];
  // String punchID = globals.punch_issue_Punch_ID[0];
  // String category = globals.punch_issue_Category[0];
  // String systemID = globals.punch_issue_System[0];
  // String subsystem = globals.punch_issue_Sub_System[0];
  // String discipline = globals.punch_issue_Discipline[0];
  // String status = globals.punch_issue_Status[0];
  // String unit = globals.punch_issue_Unit[0];
  // String area = globals.punch_issue_Area[0];
  // String tagNumber = globals.punch_issue_Tag_Number[0];
  // String bulkItem = globals.punch_issue_Bulk_Item[0];
  // String department = globals.punch_issue_Action_On[0];
  // String targetDate = globals.punch_issue_Date[0];
  // String raisedBy = globals.punch_issue_Raised_On[0];
  // String designChgReq = globals.punch_issue_Design[0];
  // String materialReq = globals.punch_issue_Material[0];
  // String issueDescription = globals.punch_issue_Description[0];
  // String keyword1 = globals.punch_issue_Keyword[0];
  // String keyword2 = globals.punch_issue_Keyword[1];
  // String keyword3 = globals.punch_issue_Keyword[2];
  // String keyword4 = globals.punch_issue_Keyword[3];

  List _nameData = [
    'projectID',
    'punchID',
    'category',
    'systemID',
    'subsystem',
    'discipline',
    'status',
    'unit',
    'area',
    'tagNumber',
    'bulkItem',
    'department',
    'targetDate',
    'raisedBy',
    'designChgReq',
    'materialReq',
    'issueDescription',
  ];

  List _listData = [
    issue.projectList,
    globals.punch_issue_Punch_ID,
    globals.punch_issue_Category,
    globals.punch_issue_System,
    globals.punch_issue_Sub_System,
    globals.punch_issue_Discipline,
    globals.punch_issue_Status,
    globals.punch_issue_Unit,
    globals.punch_issue_Area,
    globals.punch_issue_Tag_Number,
    globals.punch_issue_Bulk_Item,
    globals.punch_issue_Action_On,
    globals.punch_issue_Date,
    globals.punch_issue_Raised_On,
    globals.punch_issue_Design,
    globals.punch_issue_Material,
    globals.punch_issue_Description,
  ];
  List _keyword = globals.punch_issue_Keyword;
  Map<String, String> _mapData = {};

  @override
  void initState() {
    for (int i = 0; i < _listData.length; i++) {
      if (_listData[i].length != 0) {
        _mapData[_nameData[i]] = _listData[i][0];
      }
    }
    if (_keyword.length == 1) {
      _mapData['keyword1'] = _keyword[0];
    } else if (_keyword.length == 2) {
      _mapData['keyword1'] = _keyword[0];
      _mapData['keyword2'] = _keyword[1];
    } else if (_keyword.length == 3) {
      _mapData['keyword1'] = _keyword[0];
      _mapData['keyword2'] = _keyword[1];
      _mapData['keyword3'] = _keyword[2];
    } else if (_keyword.length == 4) {
      _mapData['keyword1'] = _keyword[0];
      _mapData['keyword2'] = _keyword[1];
      _mapData['keyword3'] = _keyword[2];
      _mapData['keyword4'] = _keyword[3];
    }
    super.initState();
  }

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
                print(_mapData);
                // _showDialog('/home');
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

                await http.post(url, body: _mapData);
                print('보낸다!!!!!!!!');

                var url2 = Uri.parse('$api/summury/photos');
                if (globals.punch_issue_Photo.length == 1) {
                  await http.post(url2, body: {
                    'punchID': globals.punch_issue_Punch_ID[0],
                    'punchStep': '1',
                    'seq': '1',
                    'localPath': globals.punch_issue_Photo_Path[0].toString(),
                    'imagePath': globals.punch_issue_Photo_Name[0].toString(),
                    'uploaded': globals.punch_issue_Switch == true ? '1' : '0',
                    'uploadDate': DateTime.now().toString(),
                  });
                } else if (globals.punch_issue_Photo.length > 1) {
                  for (var i = 0; i < globals.punch_issue_Photo.length; i++) {
                    await http.post(url2, body: {
                      'punchID': globals.punch_issue_Punch_ID[0],
                      'punchStep': '1',
                      'seq': '${i + 1}',
                      'localPath': globals.punch_issue_Photo_Path[i].toString(),
                      'imagePath': globals.punch_issue_Photo_Name[i].toString(),
                      'uploaded':
                          globals.punch_issue_Switch == true ? '1' : '0',
                      'uploadDate': DateTime.now().toString(),
                    });
                  }
                }

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
