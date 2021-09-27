import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/complete_component.dart';
import 'package:plms_start/pages/utils/header_issue.dart';
import 'package:plms_start/screens/utils/image_picker.dart';
import 'package:plms_start/screens/utils/title_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class PunchComplete extends StatefulWidget {
  const PunchComplete({Key? key}) : super(key: key);

  @override
  _PunchCompleteState createState() => _PunchCompleteState();
}

class _PunchCompleteState extends State<PunchComplete> {
  var api = dotenv.env['PHONE_IP'];
  // var api = dotenv.env['EMUL_IP'];

  var data = Get.arguments[0];

  var id = Get.arguments[1];
  var password = Get.arguments[2];
  var userName = Get.arguments[3];
  var email = Get.arguments[4];
  var company = Get.arguments[5];
  var authority = Get.arguments[6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B3745),
        automaticallyImplyLeading: false,
        title: Header(
          title: AppLocalizations.of(context)!.completeTitle,
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 1.45 / 7,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFE6E6E6),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Color(0xff2B3745),
                // height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _completeComponent(),
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
                                  title: AppLocalizations.of(context)!
                                      .completePageTitle,
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
      bottomNavigationBar: Container(
        color: Color(0xFFE6E6E6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: Get.width * 2.8 / 7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff71838D), // background
                  // onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(AppLocalizations.of(context)!.completePageButton1),
              ),
            ),
            SizedBox(
              width: Get.width * 2.8 / 7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2F4C5A), // background
                  // onPrimary: Colors.white, // foreground
                ),
                onPressed: () async {
                  // print(id);
                  // print(data['projectID']);
                  // print(data['punchID']);
                  // print(DateTime.now());

                  var url = Uri.parse('$api/summury/complete');
                  await http.post(url, body: {
                    'userID': id,
                    'projectID': data['projectID'],
                    'punchID': data['punchID'],
                    'completedDate': DateTime.now().toString(),
                  });
                  print('성공이욤');

                  Get.offAllNamed('/home', arguments: [
                    authority,
                    id,
                    password,
                    userName,
                    email,
                    company
                  ]);
                },
                child: Text(AppLocalizations.of(context)!.completePageButton2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return Column(
      children: [
        Row(
          children: [
            Text(AppLocalizations.of(context)!.completePageDescription),
          ],
        ),
        TextField(
            maxLines: 7,
            keyboardType: TextInputType.multiline,
            maxLength: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  AppLocalizations.of(context)!.completePageDescriptionLabel,
              isDense: true,
            )),
      ],
    );
  }

  Widget _completeComponent() {
    return Column(
      children: [
        _dataWidget('PunchID', data['punchID']),
        _dataWidget('Category', data['category']),
        SizedBox(
          width: 20,
        ),
        _dataWidget('Area', data['area']),
        SizedBox(
          width: 20,
        ),
        _dataWidget('Unit', data['unit']),
        _dataWidget('Tag Number', data['tagNumber']),
        _dataWidget('System', data['systemName']),
        _dataWidget('Sub-system', data['subsystemName']),
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
            Flexible(
              child: Text(
                data['notAcceptComment'],
                style: TextStyle(color: Color(0xff5D8791)),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _dataWidget(String title, String datas) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 2 / 7,
          // height: Get.height * 1 / 11,
          child: Text(
            title,
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ),
        Flexible(
          child: Text(
            datas,
            style: TextStyle(color: Colors.white, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
