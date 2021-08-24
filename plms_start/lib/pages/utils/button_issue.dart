import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../punch_screen.dart';

class IssueButton extends StatelessWidget {
  IssueButton(
      {Key? key,
      required this.name,
      required this.name2,
      required this.buttonname1,
      required this.buttonname2})
      : super(key: key);
  final String name;
  final String name2;
  final String buttonname1;
  final String buttonname2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff2F4C5A), // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Get.toNamed(name);
            },
            child: Text(buttonname1),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xff71838D)),
            onPressed: () {
              Get.toNamed(name2);
            },
            child: Text(buttonname2),
          ),
        ],
      ),
    );
  }
}
