import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/registrations/first_register.dart';
import 'package:plms_start/pages/components/registrations/second_register.dart';
import 'package:plms_start/pages/components/registrations/third_register.dart';

import 'utils/header_issue.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  FirstRegister(),
                  SecondRegister(),
                  ThirdRegister(),
                ],
              ),
            ),
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
              onPressed: () {
                setState(() {});
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
