import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:plms_start/pages/components/List_components.dart';

class ListReq extends StatelessWidget {
  const ListReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FutureBuilder listview
    return Container(
      color: Color(0xFFE6E6E6),
      child: ListView(
        children: [
          ListComponent(
              title: "Req for Close",
              data1: 'data1',
              data2: "data2",
              colors: 0xff95809D),
          ListComponent(
              title: "Req for Close",
              data1: 'data1',
              data2: "data2",
              colors: 0xff95809D),
          ListComponent(
              title: "Req for Close",
              data1: 'data1',
              data2: "data2",
              colors: 0xff95809D),
          ListComponent(
              title: "Req for Close",
              data1: 'data1',
              data2: "data2",
              colors: 0xff95809D),
          ListComponent(
              title: "Req for Close",
              data1: 'data1',
              data2: "data2",
              colors: 0xff95809D),
          ListComponent(
              title: "Req for Close",
              data1: 'data1',
              data2: "data2",
              colors: 0xff95809D),
        ],
      ),
    );
  }
}
