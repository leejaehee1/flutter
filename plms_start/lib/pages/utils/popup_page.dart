import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUpPage extends StatelessWidget {
  PopUpPage({Key? key}) : super(key: key);

  @override
  String id = Get.arguments[0];
  String password = Get.arguments[1];
  String userName = Get.arguments[2];
  String email = Get.arguments[3];
  String company = Get.arguments[4];
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      // height: 100,
      color: Colors.black54,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                color: Color(0xffdddddd),
                width: Get.width * 3.15 / 7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff304d5c)),
                    onPressed: () {
                      Get.offNamed('/modify', arguments: [
                        id,
                        password,
                        userName,
                        email,
                        company,
                      ]);
                    },
                    child: Text('Modify User Info'))),
            Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                color: Color(0xffdddddd),
                width: Get.width * 3.15 / 7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff5C8694)),
                    onPressed: () {
                      Get.offAllNamed('/');
                    },
                    child: Text('Logout'))),
            Container(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                color: Color(0xffdddddd),
                width: Get.width * 3.15 / 7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff71838c)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'))),
          ],
        ),
      ),
    );
  }
}
