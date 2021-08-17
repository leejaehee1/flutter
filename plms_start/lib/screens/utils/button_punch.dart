import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PunchButton extends StatelessWidget {
  PunchButton(
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
          onPressed: () {},
          child: Text(buttonname1),
        ),
        SizedBox(
          width: 30,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed(name);
          },
          child: Text(buttonname2),
        ),
      ],
    );
  }
}
