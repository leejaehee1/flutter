import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListOpen extends StatelessWidget {
  ListOpen({Key? key}) : super(key: key);

  final List data = Get.arguments[1];
  final int num = 1;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return num == 1
              ? Stack(children: [
                  ListComponent(
                      title: AppLocalizations.of(context)!.tile3,
                      data1:
                          "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                      data2: data[index]['system'],
                      colors: 0xffB88C69),
                  Positioned(
                    top: 7,
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
                        child:
                            Text(AppLocalizations.of(context)!.completeButton),
                      ),
                    ),
                  ),
                ])
              : ListComponent(
                  title: AppLocalizations.of(context)!.tile3,
                  data1:
                      "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
                  data2: data[index]['system'],
                  colors: 0xffB09078);
        },
      ),
    );
  }
}
