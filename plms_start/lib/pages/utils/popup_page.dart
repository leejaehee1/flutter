import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUpPage extends StatelessWidget {
  const PopUpPage({Key? key}) : super(key: key);

  @override
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
                    onPressed: () {},
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
