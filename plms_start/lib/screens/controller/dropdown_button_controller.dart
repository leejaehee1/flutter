import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plms_start/screens/data/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:plms_start/screens/models/model.dart';

enum DropDownMenu { DEFAULT, MENU1, MENU2 }
Network network = Network("http://10.0.2.2:5000/api/category/");

var resultData = network.getJsonData();
List<dynamic> data = [];

extension DropDownMenuExtention on DropDownMenu {
  dynamic get name {
    switch (this) {
      case DropDownMenu.DEFAULT:
        return 'catagory3';
      case DropDownMenu.MENU1:
        return 'catagory3';
      case DropDownMenu.MENU2:
        return 'catagory3';
    }
  }
}

class DropdownButtonController extends GetxController {
  Rx<DropDownMenu> currentItem = DropDownMenu.DEFAULT.obs;

  void changeDropDownMenu(int? itemIndex) {
    var selectedItem =
        DropDownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectedItem);
  }
}

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
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

  Future<dynamic> test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);

    var user = User.fromJson(json);
    var a = user.result[0]['category'];
    var b = user.result[1]['category'];
    print(a);
    print(a.runtimeType);
    Get.toNamed("/punchList", arguments: a);
    Get.toNamed("/punchList", arguments: b);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getJsons(),
    );
  }
}
