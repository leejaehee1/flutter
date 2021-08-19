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
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xff71838D)),
            onPressed: () {},
            child: Text(buttonname1),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff2F4C5A), // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Get.toNamed(name);
            },
            child: Text(buttonname2),
          ),
        ],
      ),
    );
  }
}
