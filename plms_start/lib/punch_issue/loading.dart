import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:plms_start/punch_issue/punch_issue.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var api = dotenv.env['PHONE_IP'];
  // var api = dotenv.env['EMUL_IP'];

  @override
  void initState() {
    test();
    super.initState();
  }

  Future<dynamic> test() async {
    List<String> category = [];
    List<String> systems = [];
    List<String> subsystem = [];
    List<String> discipline = [];
    var uriResponse = await http.get(
      Uri.parse(
          // 'http://10.0.2.2:5000/summury/category/',
          "$api/summury/category/"),
    );

    var json = jsonDecode(uriResponse.body);
    print(json.runtimeType);
    print(json[0]['category']);
    int len = json.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          category += [json[i]['category']];
        }
      });
///////////////////////////////
    var uriResponse2 = await http.get(
      Uri.parse(
          // 'http://10.0.2.2:5000/summury/systems/',
          "$api/summury/systems/"),
    );

    var json2 = jsonDecode(uriResponse2.body);
    print(json2[0]['systems']);
    int len2 = json2.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len2; i++) {
          systems += [json2[i]['systemID']];
        }
      });
/////////////////////////////
    var uriResponse3 = await http.get(
      Uri.parse(
          // 'http://10.0.2.2:5000/summury/subsystem/',
          "$api/summury/subsystem/"),
    );

    var json3 = jsonDecode(uriResponse3.body);
    print(json3[0]['subsystem']);
    int len3 = json3.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len3; i++) {
          subsystem += [json3[i]['subsystem']];
        }
      });
////////////////////////
    var uriResponse4 = await http.get(
      Uri.parse(
          // 'http://10.0.2.2:5000/summury/discipline/',
          "$api/summury/discipline/"),
    );

    var json4 = jsonDecode(uriResponse4.body);
    print(json4[0]['discipline']);
    int len4 = json4.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len4; i++) {
          discipline += [json4[i]['discipline']];
        }
      });
    Get.off(PunchScreen(), arguments: [
      category,
      systems,
      subsystem,
      discipline,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 1);
  }
}
