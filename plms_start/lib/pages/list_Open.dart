import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/list_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListOpen extends StatelessWidget {
  ListOpen({Key? key}) : super(key: key);

  final List data = Get.arguments[1];
  final int number = 0;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, var index) {
          if (data.isEmpty) {}

          return
              // number == 1
              //     ? Stack(children: [
              //         ListComponent(
              //             nums: 1,
              //             title: AppLocalizations.of(context)!.tile3,
              //             data1:
              //                 "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
              //             data2: data[index]['system'],
              //             colors: 0xffb88d6a),
              //         Positioned(
              //           top: Get.height * 1 / 80,
              //           right: Get.width * 1 / 25,
              //           child: SizedBox(
              //             width: Get.width * 1.2 / 7,
              //             height: Get.height * 1 / 45,
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 padding: EdgeInsets.only(left: 0, right: 0),
              //                 primary: Color(0xff55b093), // background
              //                 // onPrimary: Colors.white, // foreground
              //               ),
              //               onPressed: () {
              //                 // print(data[index]);
              //                 Get.toNamed('/complete', arguments: data[index]);
              //               },
              //               child: Text(
              //                 AppLocalizations.of(context)!.completeButton,
              //                 style: TextStyle(fontSize: 10),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ])
              //     :
              ListComponent(
                  title: AppLocalizations.of(context)!.tile3,
                  data1:
                      "${data[index]['punchID']},${data[index]['category']},${data[index]['disciplineName']},${data[index]['unit']},${data[index]['area']}",
                  data2: data[index]['systemName'],
                  colors: 0xffb88d6a);
        },
      ),
    );
  }
}
