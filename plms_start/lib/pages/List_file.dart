import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListFile extends StatefulWidget {
  const ListFile({Key? key}) : super(key: key);

  @override
  _ListFileState createState() => _ListFileState();
}

class _ListFileState extends State<ListFile> {
  List draftList = Get.arguments[0];
  List openList = Get.arguments[1];
  List reqList = Get.arguments[2];
  List closeList = Get.arguments[3];
  int num = 1;
  // List data =
  //     Get.arguments[0] + Get.arguments[1] + Get.arguments[2] + Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    List data = (draftList + openList + reqList + closeList);

    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, var index) {
            if (data[index]['status'] == "1") {
              return ListComponent(
                  title: AppLocalizations.of(context)!.tile2,
                  data1:
                      "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                  data2: data[index]['systemID'],
                  colors: 0xff7c4141);
            } else if (data[index]['status'] == "2" ||
                data[index]['status'] == '5') {
              return num == 1
                  ? Stack(children: [
                      ListComponent(
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
                              Get.toNamed('/complete', arguments: data[index]);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.completeButton,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ])
                  : ListComponent(
                      title: AppLocalizations.of(context)!.tile3,
                      data1:
                          "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                      data2: data[index]['systemID'],
                      colors: 0xffb88d6a);
            } else if (data[index]['status'] == "3" ||
                data[index]['status'] == '4') {
              return ListComponent(
                  title: AppLocalizations.of(context)!.tile4,
                  data1:
                      "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                  data2: data[index]['systemID'],
                  colors: 0xff987ca1);
            } else {
              return ListComponent(
                  title: AppLocalizations.of(context)!.tile5,
                  data1:
                      "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                  data2: data[index]['systemID'],
                  colors: 0xff637a8f);
            }
          }),
    );
  }
}
