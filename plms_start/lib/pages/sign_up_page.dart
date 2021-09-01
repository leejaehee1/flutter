import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plms_start/pages/components/registrations/validate.dart';

import 'package:dropdown_search/dropdown_search.dart';

import 'utils/header_issue.dart';

import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    test();
    super.initState();
  }

  Future<dynamic> test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/department/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    print(json.runtimeType);
    print(json[0]['deptName']);
    int len = json.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          deptName += [json[i]['deptName']];
          department += [json[i]['department']];
        }
      });
  }

  bool isSwitched = false;
  bool isSwitched2 = false;

  String _horizonGroupValue = "Assignee";

  List<String> _status = ["Assignee", "QC", "Manager"];

  List<String> deptName = [];
  List<String> department = [];
  List<String> depList = [];
  List<String> authorityList = ['1'];
  // int authoritylen = (authorityList.length - 1);
  List<String> deptList = [];
  int count = 0;

  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();
  final _repwTextEditController = TextEditingController();
  final _emailTextEditController = TextEditingController();
  final _comTextEditController = TextEditingController();
  final _nameTextEditController = TextEditingController();
  final _personalTextEditController = TextEditingController();

  FocusNode _emailFocus = new FocusNode();
  FocusNode _passwordFocus = new FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _idTextEditController.dispose();
    _pwTextEditController.dispose();
    _repwTextEditController.dispose();
    _emailTextEditController.dispose();
    _comTextEditController.dispose();
    _nameTextEditController.dispose();
    _personalTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B3745),
        automaticallyImplyLeading: false,
        title: Header(
          title: AppLocalizations.of(context)!.signUpHeader,
        ),
      ),
      body: DefaultTabController(
        // initialIndex: 0,
        length: 3,
        // child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     child: _firstPage()),
        child: ListView(
          children: [
            _firstPage(),
            _checkPage1(AppLocalizations.of(context)!.signUpcheckPage1, 'data'),
            _checkPage2(AppLocalizations.of(context)!.signUpcheckPage2, 'data'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFE6E6E6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff71838D),
              ),
              child:
                  new Text(AppLocalizations.of(context)!.signUpbottomButton1),
              onPressed: () {
                Get.back();
              },
            ),
            new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff2F4C5A), // background
                // onPrimary: Colors.white, // foreground
              ),
              child:
                  new Text(AppLocalizations.of(context)!.signUpbottomButton2),
              onPressed: () async {
                if ((isSwitched & isSwitched2 == true)) {
                  formKey.currentState!.validate();
                  print(AppLocalizations.of(context)!.signUpbottomButton2);
                } else {
                  return null;
                }

                if (((formKey.currentState!.validate() == true))) {
                  print(formKey.currentState!.validate());
                  var url = Uri.parse('http://10.0.2.2:5000/api/register');
                  await http.post(url, body: {
                    'userID': _idTextEditController.text,
                    'password': _pwTextEditController.text,
                    'userName': _nameTextEditController.text,
                    'email': _emailTextEditController.text,
                    'company': _comTextEditController.text,
                    'authority': authorityList[authorityList.length - 1],
                    'personalID': _personalTextEditController.text,
                    'department': depList[depList.length - 1],
                    'active': '1',
                  });
                  Get.back();
                } else {
                  Get.defaultDialog(
                      title: 'Error',
                      middleText: 'Check your Email or Password');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstPage() {
    return Form(
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _radioButton(),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all(width: 0.3)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      _textField(
                          AppLocalizations.of(context)!.signUpID,
                          _idTextEditController,
                          AppLocalizations.of(context)!.signUpID),
                      SizedBox(
                        height: 20,
                      ),
                      _pwFormField(
                        AppLocalizations.of(context)!.signUpPW,
                        _pwTextEditController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _repwtextField(
                          AppLocalizations.of(context)!.signUprepw,
                          _repwTextEditController,
                          AppLocalizations.of(context)!.signUprepw),
                      SizedBox(
                        height: 20,
                      ),
                      _emailFormField(
                        AppLocalizations.of(context)!.signUpmail,
                        _emailTextEditController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _textField(
                          AppLocalizations.of(context)!.signUpcom,
                          _comTextEditController,
                          AppLocalizations.of(context)!.signUpcom),
                      SizedBox(
                        height: 20,
                      ),
                      _textField(
                          AppLocalizations.of(context)!.signUpname,
                          _nameTextEditController,
                          AppLocalizations.of(context)!.signUpname),
                      SizedBox(
                        height: 20,
                      ),
                      _textField(
                          AppLocalizations.of(context)!.signUppersonal,
                          _personalTextEditController,
                          AppLocalizations.of(context)!.signUppersonal),
                      SizedBox(
                        height: 20,
                      ),
                      _newButton(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _newButton() {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(AppLocalizations.of(context)!.signUpdept),
        ),
        Container(
          width: Get.width * 3 / 5,
          height: Get.height * 1 / 13,
          child: DropdownSearch<String>(
            onSaved: print,
            showSearchBox: true,
            mode: Mode.MENU,
            showSelectedItem: true,
            items: deptName,
            label: AppLocalizations.of(context)!.signUpdeptselect,
            popupItemDisabled: (String s) => s.startsWith('I'),
            onChanged: (valued) {
              setState(() {
                for (var i = 0; i < deptName.length; i++) {
                  if (valued == deptName[i]) {
                    depList.add(department[i]);
                  }
                }

                print(depList);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _swichs() {
    return Row(
      children: [
        Checkbox(
          value: isSwitched,
          onChanged: (valued) {
            setState(() {
              isSwitched = valued!;
              print(isSwitched);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
        SizedBox(
          width: 90,
          child: Text(AppLocalizations.of(context)!.signUpcheckbox),
        ),
      ],
    );
  }

  Widget _swichs2() {
    return Row(
      children: [
        Checkbox(
          value: isSwitched2,
          onChanged: (value) {
            setState(() {
              isSwitched2 = value!;
              print(isSwitched2);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
        SizedBox(
          width: 90,
          child: Text(AppLocalizations.of(context)!.signUpcheckbox),
        ),
      ],
    );
  }

  Widget _textField(String title, var controller, String hint) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(title)),
        SizedBox(
          width: Get.width * 3 / 5,
          height: Get.height * 1 / 13,
          child: TextFormField(
            controller: controller,
            decoration: _textDecoration(hint),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  InputDecoration _textDecoration(hintText) {
    return new InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 16, 0, 0),
      border: OutlineInputBorder(),
      hintText: hintText,
      // helperText: helperText,
    );
  }

  Widget _repwtextField(String title, var controller, String hint) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(title)),
        SizedBox(
          width: Get.width * 3 / 5,
          height: Get.height * 1 / 13,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (val) {
              if (val != _pwTextEditController.text) return 'Not Match';
              return null;
            },
            controller: controller,
            decoration: _textDecoration(hint),
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
        SizedBox(width: 100, child: Text(title)),
        SizedBox(
          width: Get.width * 3 / 5,
          height: Get.height * 1.19 / 9,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            focusNode: _passwordFocus,
            obscureText: true,
            validator: (value) =>
                CheckValidate().validatePassword(_passwordFocus, value!),
            controller: controller,
            decoration: _textFormDecoration(
                AppLocalizations.of(context)!.signUppwForm1,
                AppLocalizations.of(context)!.signUppwForm2),
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
        SizedBox(width: 100, child: Text(title)),
        SizedBox(
          width: Get.width * 3 / 5,
          height: Get.height * 1 / 9,
          child: TextFormField(
            validator: (value) =>
                CheckValidate().validateEmail(_emailFocus, value!),
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocus,
            decoration: _textFormDecoration(
                AppLocalizations.of(context)!.signUpmailForm1,
                AppLocalizations.of(context)!.signUpmailForm2),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  InputDecoration _textFormDecoration(hintText, helperText) {
    return new InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 16, 0, 0),
      border: OutlineInputBorder(),
      helperMaxLines: 2,
      hintText: hintText,
      helperText: helperText,
    );
  }

  Widget _radioButton() {
    return RadioGroup<String>.builder(
      direction: Axis.horizontal,
      groupValue: _horizonGroupValue,
      onChanged: (value) => setState(() {
        _horizonGroupValue = value!;
        if (value == _status[0]) {
          authorityList.add('1');
        }
        if (value == _status[1]) {
          authorityList.add('4');
        }
        if (value == _status[2]) {
          authorityList.add('3');
        }
        print(authorityList);
      }),
      items: _status,
      itemBuilder: (item) => RadioButtonBuilder(
        item,
        textPosition: RadioButtonTextPosition.left,
      ),
    );
  }

  Widget _checkPage1(String title, String data) {
    // bool isSwitched1 = false;

    return Container(
      // height: MediaQuery.of(context).size.height,
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
                Column(
                  children: [
                    Text(title),
                    Container(
                      color: Color(0xffeeeeee),
                      height: 200,
                      child: ListView(
                        children: [Text(data)],
                      ),
                    ),
                    _swichs()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _checkPage2(String title, String data) {
    // bool isSwitched1 = false;

    return Container(
      // height: MediaQuery.of(context).size.height,
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
                Column(
                  children: [
                    Text(title),
                    Container(
                      color: Color(0xffeeeeee),
                      height: 200,
                      child: ListView(
                        children: [Text(data)],
                      ),
                    ),
                    _swichs2()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
