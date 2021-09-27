import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plms_start/pages/components/registrations/validate.dart';

import 'package:http/http.dart' as http;

class ModifyPage extends StatefulWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  _ModifyPageState createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {
  final _idTextEditController = TextEditingController(text: Get.arguments[0]);
  final _pwTextEditController = TextEditingController();
  final _repwTextEditController = TextEditingController();
  final _emailTextEditController =
      TextEditingController(text: Get.arguments[3]);
  final _comTextEditController = TextEditingController(text: Get.arguments[4]);
  final _nameTextEditController = TextEditingController(text: Get.arguments[2]);
  // final _personalTextEditController = TextEditingController(text: 'hi');

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  String pwData = Get.arguments[1];

  final formKey = GlobalKey<FormState>();

  FocusNode _pwFocusNode = FocusNode();

  // var api = dotenv.env['EMUL_IP'];
  var api = dotenv.env['PHONE_IP'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.3)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                            _enabletextField(
                              AppLocalizations.of(context)!.signUpID,
                              _idTextEditController,
                            ),
                            _size15(),
                            _pwFormField(
                              AppLocalizations.of(context)!.signUpPW,
                              _pwTextEditController,
                            ),
                            _size15(),
                            _repwtextField(
                              AppLocalizations.of(context)!.signUprepw,
                              _repwTextEditController,
                            ),
                            _size15(),
                            _enabletextField(
                              AppLocalizations.of(context)!.signUpmail,
                              _emailTextEditController,
                            ),
                            _size15(),
                            _enabletextField(
                              AppLocalizations.of(context)!.signUpcom,
                              _comTextEditController,
                            ),
                            _size15(),
                            _enabletextField(
                              AppLocalizations.of(context)!.signUpname,
                              _nameTextEditController,
                            ),
                            _size15(),
                            // _enabletextField(
                            //   AppLocalizations.of(context)!.signUppersonal,
                            //   _personalTextEditController,
                            // ),
                            _size15(),
                            _size15(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFE6E6E6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 2.2 / 7,
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff71838D),
                ),
                child:
                    new Text(AppLocalizations.of(context)!.signUpbottomButton1),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Container(
              width: Get.width * 2.2 / 7,
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2F4C5A), // background
                  // onPrimary: Colors.white, // foreground
                ),
                child:
                    new Text(AppLocalizations.of(context)!.signUpbottomButton2),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var url = Uri.parse('$api/summury/update');

                    await http.post(url, body: {
                      'userID': Get.arguments[0],
                      'password': _repwTextEditController.text,
                    });
                    Get.offAllNamed('/');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _size15() {
    return SizedBox(
      height: 15,
    );
  }

  Widget _textField(String title, var controller) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 1 / 3.9,
          child: Text(title),
        ),
        SizedBox(
          width: Get.width * 2.9 / 5,
          height: Get.height * 1.3 / 25,
          child: TextFormField(
            style: TextStyle(fontSize: 17),
            controller: controller,
            decoration: _textDecoration(),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _enabletextField(String title, var controller) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 1 / 3.9,
          child: Text(
            title,
            style: TextStyle(),
          ),
        ),
        SizedBox(
          width: Get.width * 2.9 / 5,
          height: Get.height * 1.3 / 25,
          child: TextFormField(
            enabled: false,
            style: TextStyle(fontSize: 17),
            controller: controller,
            decoration: _textDecoration(),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  InputDecoration _textDecoration() {
    return new InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 16, 0, 0),
      border: OutlineInputBorder(),
      // helperText: helperText,
    );
  }

  Widget _repwtextField(String title, var controller) {
    return Row(
      children: [
        SizedBox(width: Get.width * 1 / 3.9, child: Text(title)),
        SizedBox(
          width: Get.width * 2.9 / 5,
          height: Get.height * 1.95 / 25,
          child: TextFormField(
            maxLength: 10,
            style: TextStyle(fontSize: 17),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) =>
                CheckValidate().validatePassword(_passwordFocus, value!),
            controller: controller,
            decoration: _textDecoration(),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _pwFormField(String title, var controller) {
    return Row(
      children: [
        SizedBox(width: Get.width * 1 / 3.9, child: Text(title)),
        SizedBox(
          width: Get.width * 2.9 / 5,
          height: Get.height * 1.95 / 25,
          child: TextFormField(
            maxLength: 10,
            style: TextStyle(fontSize: 17),
            keyboardType: TextInputType.visiblePassword,
            focusNode: _pwFocusNode,
            obscureText: true,
            validator: (value) {
              if (value != pwData) {
                return '비밀번호를 다시 입력하세요';
              }
            },
            controller: controller,
            decoration: _textFormDecoration(),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _emailFormField(String title, var controller) {
    return Row(
      children: [
        SizedBox(width: Get.width * 1 / 3.9, child: Text(title)),
        Container(
          width: Get.width * 2.9 / 5,
          height: Get.height * 2.1 / 25,
          child: TextFormField(
            style: TextStyle(fontSize: 17),
            validator: (value) =>
                CheckValidate().validateEmail(_emailFocus, value!),
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocus,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: OutlineInputBorder(),
              helperText: '이메일을 입력하세요',
            ),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  InputDecoration _textFormDecoration() {
    return new InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      border: OutlineInputBorder(),

      // helperText: helperText,
    );
  }
}
