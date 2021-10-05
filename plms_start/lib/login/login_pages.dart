import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../globals/login.dart' as login;

// import 'package:google_fonts/google_fonts.dart';

/*
* name : LoginPage
* description : login page
* writer : john
* create date : 2021-09-30
* last update : 2021-09-30
* */
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();

  late double headerTopZone;

  var api = dotenv.env['PHONE_IP'];
  // var api = dotenv.env['EMUL_IP'];

  @override
  void initState() {
    login.authority = [];
    login.userID = [];
    login.password = [];
    login.userName = [];
    login.email = [];
    login.company = [];
    login.personalID = [];
    login.department = [];
    super.initState();
  }

  @override
  void dispose() {
    _idTextEditController.dispose();
    _pwTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    headerTopZone = Get.mediaQuery.padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _background(),
          Positioned(
            left: 0,
            right: 0,
            top: Get.height * 4.5 / 8,
            bottom: 10,
            child: Column(
              children: [
                _textForm(),
                SizedBox(
                  height: 30,
                ),
                _button(),
                SizedBox(
                  height: 30,
                ),
                _signupText(),
                SizedBox(
                  height: 5,
                ),
                _textButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 배경화면
  Widget _background() {
    return SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/login_page3.png",
            ),
          ),
        ),
      ),
    );
  }

  // login form
  Widget _textForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height * 1 / 30,
            width: Get.width * 4.5 / 7,
            child: TextFormField(
              controller: _idTextEditController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.loginID,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: Get.height * 1 / 30,
          ),
          Container(
            height: Get.height * 1 / 30,
            width: Get.width * 4.5 / 7,
            child: TextFormField(
              controller: _pwTextEditController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.loginPW,
                // labelText: AppLocalizations.of(context)!.loginPW,
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  // login button
  Widget _button() {
    return Container(
      width: Get.width * 3 / 7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff304D5B),
        ),
        // onPressed: () {
        //   Get.toNamed('/home');
        // },
        onPressed: () async {
          // var url = Uri.parse('http://10.0.2.2:5000/api/login');
          var url = Uri.parse('$api/summury/login');
          var response = await http.post(url, body: {
            'userID': _idTextEditController.text,
            'password': _pwTextEditController.text,
          });
          print("response: ${response.body}");
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          print("jsonData: $jsonData");
          print(jsonData['authority']);
          print(jsonData['password']);
          print(jsonData['personalID']);
          print(jsonData['department']);
          if (jsonData['result'] == false) {
            _showDialog();
          }

          if (jsonData['userID'] == _idTextEditController.text) {
            login.authority.add(jsonData['authority']);
            login.userID.add(jsonData['userID']);
            login.password.add(_pwTextEditController.text);
            login.userName.add(jsonData['userName']);
            login.email.add(jsonData['email']);
            login.company.add(jsonData['company']);
            login.personalID.add(
                jsonData['personalID'] == null ? ' ' : jsonData['personalID']);
            login.department.add(
                jsonData['department'] == null ? ' ' : jsonData['department']);
            Get.toNamed('/home');
          } else {
            _showDialog();
          }
        },
        child: Text(
          AppLocalizations.of(context)!.signIn,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // signup form
  Widget _signupText() {
    return Column(
      children: [
        Container(
          // width: 1,
          height: 3,
          child: Icon(
            Icons.arrow_drop_down,
            size: 50,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.signUpText,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _textButton() {
    return TextButton(
        onPressed: () {
          Get.toNamed("/signup");
        },
        child: Text(
          AppLocalizations.of(context)!.signUp,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ));
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(AppLocalizations.of(context)!.loginDialogText),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D),
                  ),
                  child:
                      new Text(AppLocalizations.of(context)!.loginDialogButton),
                  onPressed: () {
                    Get.back();
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
