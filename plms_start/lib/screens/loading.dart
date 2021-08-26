import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    test();
    super.initState();
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
    Get.toNamed("/punchList", arguments: user);
    // Get.toNamed("/punchList", arguments: b);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 0);
  }
}
