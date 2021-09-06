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
  var data = Get.arguments;

  // @override
  // void initState() {
  //   test();
  //   super.initState();
  // }

  // final List<String> data1 = [data[0]];

  // final List<String> data2 = [
  //   'data1',
  //   'data2',
  //   'data3',
  //   'asdf',
  //   '01234567890123456789012345678901'
  // ];

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
              data1: data[0]["punchID"],
              data2: data[1]["punchID"],
              colors: 0xff7B3F40);
        },
      ),
    );
  }
}
