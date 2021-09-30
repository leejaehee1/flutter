import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/list_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/*
* name : ListOpen Page
* description : open data page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class ListOpen extends StatefulWidget {
  ListOpen({Key? key}) : super(key: key);

  @override
  _ListOpenState createState() => _ListOpenState();
}

class _ListOpenState extends State<ListOpen> {
  final List data = Get.arguments[1];

  String id = Get.arguments[4];
  String password = Get.arguments[5];
  String userName = Get.arguments[6];
  String email = Get.arguments[7];
  String company = Get.arguments[8];
  String authority = Get.arguments[9];

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, var index) {
          if (data.isEmpty) {}

          return Stack(children: [
            ListComponent(
                nums: 1,
                title: AppLocalizations.of(context)!.tile3,
                data1:
                    "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                data2: data[index]['systemID'],
                colors: 0xffb88d6a),
            Positioned(
              top: Get.height * 1 / 80,
              right: Get.width * 1 / 25,
              child: SizedBox(
                width: Get.width * 1.2 / 7,
                height: Get.height * 1 / 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 0, right: 0),
                    primary: Color(0xff55b093), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    // print(data[index]);
                    Get.toNamed('/complete', arguments: [
                      data[index],
                      id,
                      password,
                      userName,
                      email,
                      company,
                      authority,
                    ]);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.completeButton,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
