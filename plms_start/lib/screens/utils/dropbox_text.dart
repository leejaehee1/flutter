import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:plms_start/screens/models/model.dart';
import 'dart:convert';

import 'dropdown_button.dart';

class DropboxText extends StatefulWidget {
  final String text;

  DropboxText({Key? key, required this.text}) : super(key: key);

  @override
  _DropboxTextState createState() => _DropboxTextState();
}

class _DropboxTextState extends State<DropboxText> {
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
    // Get.toNamed("/punchList", arguments: b);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.text),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 4 / 7,
          height: 50,
          child: DropdownButtonWidget(),
        ),
      ],
    );
  }
}
