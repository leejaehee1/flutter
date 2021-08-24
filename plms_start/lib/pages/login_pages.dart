import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();

  @override
  void dispose() {
    _idTextEditController.dispose();
    _pwTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFFE6E6E6),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 6,
                ),
                Text(
                  "Punch List",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "Management System",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  height: MediaQuery.of(context).size.width * 4 / 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  // color: Colors.white,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _idTextEditController,
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.loginID,
                            labelText: AppLocalizations.of(context)!.loginID),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        controller: _pwTextEditController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.loginPW,
                            labelText: AppLocalizations.of(context)!.loginPW),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 3 / 8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff304D5B),
                          ),
                          onPressed: () {
                            Get.toNamed("/home");
                          },
                          // onPressed: () async {
                          //   // 서버에서 username and password 비교를 해서 로그인 되어야 한다.
                          //   // response.OK => Get.toNamed('/home'); and 세션(이 사용자와 관련한 정보를 가지고 있습니다.)
                          //   var url = Uri.http('10.0.2.2:5000', '/api/login',
                          //       // {'userId': 'admin11', 'password': 'admin1'});
                          //       {'userId': 'admin3', 'password': 'admin2'});

                          //   // Await the http get response, then decode the json-formatted response.
                          //   var response = await http.get(url);
                          //   if (response.statusCode == 200) {
                          //     var jsonResponse =
                          //         convert.jsonDecode(response.body)
                          //             as Map<String, dynamic>;
                          //     var itemCount = jsonResponse['totalItems'];
                          //     print('Number of books about http: $itemCount.');
                          //     print('간다간다 쑝간다!');
                          //     Get.toNamed('/home');
                          //   } else {
                          //     print(
                          //         'Request failed with status: ${response.statusCode}.');
                          //     // 에러 메시지를 사용자가 알 수 있게
                          //   }
                          // },
                          // onPressed: () async {
                          //   var url =
                          //       Uri.parse('http://10.0.2.2:5000/api/login');
                          //   var response = await http.post(url, body: {
                          //     'userID': _idTextEditController.text,
                          //     'password': _pwTextEditController.text,
                          //   });
                          //   print('Response status: ${response.statusCode}');
                          //   print('Response body: ${response.body}');
                          //   if (response.body == "true") {
                          //     print('간다간다 쑝간다!');
                          //     Get.toNamed('/home');
                          //   } else {
                          //     print("fail");
                          //     _showDialog();
                          //   }
                          // },
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(AppLocalizations.of(context)!.signUpText),
                          Icon(Icons.arrow_downward_sharp),
                          TextButton(
                              onPressed: () {
                                Get.toNamed("/signup");
                              },
                              child: Text(
                                AppLocalizations.of(context)!.signUp,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }

  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: new Text(AppLocalizations.of(context)!.loginDialogText),
  //         actions: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               new ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   primary: Color(0xff71838D),
  //                 ),
  //                 child:
  //                     new Text(AppLocalizations.of(context)!.loginDialogButton),
  //                 onPressed: () {
  //                   Get.back();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
