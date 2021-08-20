import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';

class ListFile extends StatelessWidget {
  const ListFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView(
        children: [
          Stack(children: [
            ListComponent(colors: 0xffB88C69),
            Positioned(
              top: 20,
              right: 20,
              child: SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2F4C5A), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Get.toNamed('/complete');
                  },
                  child: Text('Complete'),
                ),
              ),
            ),
          ]),
          ListComponent(colors: 0xffB88C69),
          ListComponent(colors: 0xffB88C69),
          ListComponent(colors: 0xffB88C69),
          ListComponent(colors: 0xffB88C69),
          ListComponent(colors: 0xffB88C69),
          ListComponent(colors: 0xffB88C69),
        ],
      ),
    );
  }
}
