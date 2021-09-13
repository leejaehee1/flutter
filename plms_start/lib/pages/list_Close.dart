import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListClose extends StatelessWidget {
  ListClose({Key? key}) : super(key: key);

  final List data = Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          if (data.length == 0) {}
          return ListComponent(
              title: AppLocalizations.of(context)!.tile5,
              data1:
                  "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
              data2: data[index]['system'],
              colors: 0xff637a8f);
        },
      ),
    );
  }
}
