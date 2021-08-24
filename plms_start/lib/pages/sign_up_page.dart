import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'utils/header_issue.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

enum Duty { Assignee, QC, Manager }

class _SignUpPageState extends State<SignUpPage> {
  Duty? _duty = Duty.Assignee;
  bool isSwitched = false;
  bool isSwitched2 = false;

  int count = 0;

  final _idTextEditController = TextEditingController();
  final _pwTextEditController = TextEditingController();
  final _repwTextEditController = TextEditingController();
  final _emailTextEditController = TextEditingController();
  final _comTextEditController = TextEditingController();
  final _nameTextEditController = TextEditingController();
  final _personalTextEditController = TextEditingController();

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
                  print(AppLocalizations.of(context)!.signUpbottomButton2);
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstPage() {
    return Container(
      height: MediaQuery.of(context).size.height,
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
                    _textField(AppLocalizations.of(context)!.signUpID,
                        _idTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField(AppLocalizations.of(context)!.signUpPW,
                        _pwTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField(AppLocalizations.of(context)!.signUprepw,
                        _repwTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField(AppLocalizations.of(context)!.signUpmail,
                        _emailTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField(AppLocalizations.of(context)!.signUpcom,
                        _comTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField(AppLocalizations.of(context)!.signUpname,
                        _nameTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField(AppLocalizations.of(context)!.signUppersonal,
                        _personalTextEditController),
                    // DropboxText2(text: "Department"),
                    ElevatedButton(
                        onPressed: () {
                          print(_duty!.index);
                          print(Duty);
                        },
                        child: Text('test')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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

  Widget _textField(String title, var controller) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(title)),
        SizedBox(
          width: 200,
          height: 30,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _radioButton() {
    return Column(
      children: <Widget>[
        ListTile(
          //ListTile - title에는 내용,
          //leading or trailing에 체크박스나 더보기와 같은 아이콘을 넣는다.
          title: SizedBox(
            width: 30,
            child: Text(
              AppLocalizations.of(context)!.signUpDuty1,
              style: TextStyle(fontSize: 13),
            ),
          ),
          leading: Radio<Duty>(
            value: Duty.Assignee,
            groupValue: _duty,
            onChanged: (Duty? value) {
              setState(() {
                _duty = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.signUpDuty2,
            style: TextStyle(fontSize: 13),
          ),
          leading: Radio<Duty>(
            value: Duty.QC,
            groupValue: _duty,
            onChanged: (Duty? value) {
              setState(() {
                _duty = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.signUpDuty3,
            style: TextStyle(fontSize: 13),
          ),
          leading: Radio<Duty>(
            value: Duty.Manager,
            groupValue: _duty,
            onChanged: (Duty? value) {
              setState(() {
                _duty = value;
              });
            },
          ),
        ),
      ],
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
