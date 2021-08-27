import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:plms_start/screens/models/model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Newbutton extends StatefulWidget {
  Newbutton({Key? key}) : super(key: key);

  @override
  _NewbuttonState createState() => _NewbuttonState();
}

class _NewbuttonState extends State<Newbutton> {
  List<String> data = [];

  dynamic test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    var user = User.fromJson(json);
    int len = user.result.length;

    this.setState(() {
      for (int i = 0; i < len; i++) {
        data += [user.result[i]['category']];
      }
    });

    print(data);
  }

  void initState() {
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: DropdownSearch<String>(
          onSaved: print,
          showSearchBox: true,
          mode: Mode.MENU,
          showSelectedItem: true,
          items: data,
          label: "Menu mode",
          hint: "country in menu mode",
          popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: print,
          selectedItem: data[0]),
    );
  }
}
