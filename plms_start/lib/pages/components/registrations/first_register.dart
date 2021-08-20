import 'package:flutter/material.dart';
import 'package:plms_start/pages/utils/checkbox_register.dart';
import 'package:plms_start/screens/utils/dropbox_text2.dart';
import 'package:plms_start/pages/utils/textfield_register.dart';
import 'package:plms_start/screens/utils/textfield_text.dart';

class FirstRegister extends StatefulWidget {
  const FirstRegister({Key? key}) : super(key: key);

  @override
  _FirstRegisterState createState() => _FirstRegisterState();
}

class _FirstRegisterState extends State<FirstRegister> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Container(
      height: MediaQuery.of(context).size.height,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CheckBoxButton(name: 'Assignee'),
                    CheckBoxButton(name: 'QC'),
                    CheckBoxButton(name: 'Manager'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextFieldRegister(text: "User ID"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldRegister(text: "Password"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldRegister(text: "Retry Pasword"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldRegister(text: "E-mail"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldRegister(text: "Company"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldRegister(text: "User Name"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldRegister(text: "Personal ID"),
                    SizedBox(
                      height: 20,
                    ),
                    DropboxText2(text: "Department")
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
