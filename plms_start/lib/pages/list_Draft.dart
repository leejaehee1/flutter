import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListDraft extends StatefulWidget {
  ListDraft({Key? key}) : super(key: key);

  @override
  _ListDraftState createState() => _ListDraftState();
}

class _ListDraftState extends State<ListDraft> {
  List data = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListComponent(
              title: AppLocalizations.of(context)!.tile2,
              data1:
                  "${data[index]['punchID']},${data[index]['category']},${data[index]['discipline']},${data[index]['unit']},${data[index]['area']}",
              data2: data[index]['system'],
              colors: 0xff7B3F40);
        },
      ),
    );
  }
}
