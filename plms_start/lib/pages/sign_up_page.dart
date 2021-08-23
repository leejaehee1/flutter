import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/registrations/first_register.dart';
import 'package:plms_start/pages/components/registrations/second_register.dart';
import 'package:plms_start/pages/components/registrations/third_register.dart';
import 'package:http/http.dart' as http;

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
        title: Header(),
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
            _checkPage1('프로그램 서비스 이용약관', 'data'),
            _checkPage1('개인정보 수집 및 활동 동의', 'data'),
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
              child: new Text("Cancel"),
              onPressed: () {
                Get.back();
              },
            ),
            new ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff2F4C5A), // background
                // onPrimary: Colors.white, // foreground
              ),
              child: new Text("Registation"),
              onPressed: () async {
                var url = Uri.parse('http://10.0.2.2:5000/api/register');
                var response = await http.post(url, body: {
                  "userID": _idTextEditController.text,
                  "password": _pwTextEditController.text,
                  // "Retry Pasword": _repwTextEditController.text,
                  // "E-mail": _emailTextEditController.text,
                  // "Company": _comTextEditController.text,
                  // "User Name": _nameTextEditController.text,
                  // "Personal ID": _personalTextEditController.text,
                });
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body.hashCode}');
                if (response.body.hashCode == 972047478) {
                  print('실패');
                  // Get.back();
                } else {
                  print("성공");
                  Get.back();
                  // _showDialog();
                }
                ;
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
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    _textField("User ID", _idTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Password", _pwTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Retry Pasword", _repwTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("E-mail", _emailTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Company", _comTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("User Name", _nameTextEditController),
                    SizedBox(
                      height: 20,
                    ),
                    _textField("Personal ID", _personalTextEditController),
                    // DropboxText2(text: "Department"),
                    ElevatedButton(
                        onPressed: () {
                          print(_duty!.index);
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
          onChanged: (value) {
            setState(() {
              isSwitched = value!;
              print(isSwitched);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
        SizedBox(
          width: 90,
          child: Text('Yes, I agree'),
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
              setState(() {
                // dataList.add(controller.text);
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget _radioButton() {
    return Column(
      children: <Widget>[
        ListTile(
          //ListTile - title에는 내용,
          //leading or trailing에 체크박스나 더보기와 같은 아이콘을 넣는다.
          title: SizedBox(
            width: 30,
            child: const Text(
              'Assignee',
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
          title: const Text(
            'QC',
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
          title: const Text(
            'Manager',
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
}
