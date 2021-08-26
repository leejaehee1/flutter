import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import '../punch_screen.dart';

class IssueButton extends StatefulWidget {
  IssueButton(
      {Key? key,
      required this.name,
      required this.name2,
      required this.buttonname1,
      required this.buttonname2})
      : super(key: key);
  final String name;
  final String name2;
  final String buttonname1;
  final String buttonname2;

  @override
  _IssueButtonState createState() => _IssueButtonState();
}

class _IssueButtonState extends State<IssueButton> {
  void initState() {
    // getJsons();
    test();
    super.initState();
  }

  // dynamic getJsons() {
  //   Network network = Network("http://10.0.2.2:5000/api/category/");

  //   var resultData = network.getJsonData();
  //   print(resultData);
  // }

  dynamic test() async {
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

    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff2F4C5A), // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Get.toNamed(widget.name);
            },
            child: Text(widget.buttonname1),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color(0xff71838D)),
            onPressed: () {
              Get.toNamed(widget.name2);
            },
            child: Text(widget.buttonname2),
          ),
        ],
      ),
    );
  }
}
