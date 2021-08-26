import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plms_start/screens/data/network.dart';
import 'package:plms_start/screens/models/model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Newbutton extends StatefulWidget {
  Newbutton({Key? key}) : super(key: key);

  @override
  _NewbuttonState createState() => _NewbuttonState();
}

class _NewbuttonState extends State<Newbutton> {
  final String aa = Get.arguments;

  String? firstCategory;
  void initState() {
    getJsons();
    test();
    super.initState();
  }

  dynamic getJsons() {
    Network network = Network("http://10.0.2.2:5000/api/category/");

    var resultData = network.getJsonData();
    print(resultData);
  }

  dynamic test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    var user = User.fromJson(json);
    String firstCategory = user.result[0]['category'];
    var b = user.result[1]['category'];
    print(firstCategory);
    print(firstCategory.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        mode: Mode.MENU,
        showSelectedItem: true,
        items: ["$aa", "Italia (Disabled)", "Tunisia", 'Canada'],
        label: "Menu mode",
        hint: "country in menu mode",
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: "Brazil");
  }
}
