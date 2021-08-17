import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../punch_screen.dart';

class IssueButton extends StatelessWidget {
  IssueButton(
      {Key? key,
      required this.name,
      required this.buttonname1,
      required this.buttonname2})
      : super(key: key);
  String name;
  String buttonname1;
  String buttonname2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.toNamed(name);
          },
          child: Text(buttonname1),
        ),
        SizedBox(
          width: 30,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(buttonname2),
        ),
      ],
    );
  }
}
