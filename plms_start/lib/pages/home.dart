import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:plms_start/pages/screenList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    test();
    super.initState();
  }

  Future<dynamic> test() async {
    List<String> authority = [Get.arguments[0]];
    List<String> id = [Get.arguments[1]];
    // List sqlall = [];
    // List sqlqc = [];
    // List sqlassi = [];

    // var len = sqlall.length;
    // var len2 = sqlqc.length;
    // var len3 = sqlassi.length;

    List<Map> draftList = [];
    List<Map> openList = [];
    List<Map> reqList = [];
    List<Map> closeList = [];

    if (authority[0] == "3") {
      var uriResponse = await http.get(
        Uri.parse(
            // 'http://10.0.2.2:5000/summury/category/',
            "http://172.30.1.42:5000/summury/sqlall/"),
      );
      var sqlall = jsonDecode(uriResponse.body);
      print(json.runtimeType);
      // sqlall += json;
      print("sqlall[0]: ${sqlall[0]}");
      if (mounted)
        setState(() {
          for (int i = 0; i < sqlall.length; i++) {
            if (sqlall[i]['status'] == "1") {
              draftList += sqlall[i];
            } else if (sqlall[i]['status'] == "2" ||
                sqlall[i]['status'] == "5") {
              openList += sqlall[i];
            } else if (sqlall[i]['status'] == "3" ||
                sqlall[i]['status'] == "4") {
              reqList += sqlall[i];
            }

            print("draftList: $draftList");
            print("openList: $openList");
            print("reqList: $reqList");
            print("closeList: $closeList");
          }
        });

      Get.off(() => ScreenList(), arguments: draftList);
    } else if (authority[0] == "1") {
      var url = Uri.parse('http://172.30.1.42:5000/summury/sqlassi/');
      var response = await http.post(url, body: {
        'userID': id[0],
      });
      var sqlassi = jsonDecode(response.body);
      // print('json2$json2');
      //  += json2;
      print("sqlassi[0]: ${sqlassi[0]}");

      if (mounted)
        this.setState(() {
          for (int i = 0; i < sqlassi.length; i++) {
            if (sqlassi[i]['status'] == "1") {
              draftList += sqlassi[i];
            } else if (sqlassi[i]['status'] == "2" ||
                sqlassi[i]['status'] == '5') {
              openList += sqlassi[i];
            } else if (sqlassi[i]['status'] == '3' ||
                sqlassi[i]['status'] == '4') {
              reqList += sqlassi[i];
            }

            print("draftList: $draftList");
            print("openList: $openList");
            print("reqList: $reqList");
            print("closeList: $closeList");
          }
        });

      Get.off(() => ScreenList(), arguments: draftList);
    } else {
      var url = Uri.parse('http://172.30.1.42:5000/summury/sqlqc/');
      var response = await http.post(url, body: {
        'userID': id[0],
      });
      var sqlqc = jsonDecode(response.body);
      // print('json3$json3');
      //  += json3;
      print("sqlassi[0]: ${sqlqc[0]}");
      if (mounted)
        this.setState(() {
          for (int i = 0; i < sqlqc.length; i++) {
            if (sqlqc[i]['status'] == '1') {
              draftList += sqlqc[i];
            } else if (sqlqc[i]['status'] == '2' || sqlqc[i]['status'] == '5') {
              openList += sqlqc[i];
            } else if (sqlqc[i]['status'] == '3' || sqlqc[i]['status'] == '4') {
              reqList += sqlqc[i];
            }

            print("draftList: $draftList");
            print("openList: $openList");
            print("reqList: $reqList");
            print("closeList: $closeList");
          }
        });

      Get.off(() => ScreenList(), arguments: draftList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 1);
  }
}
