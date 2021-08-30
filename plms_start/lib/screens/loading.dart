import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    List<String> data = [];
    List<String> data2 = [];
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    print(json.runtimeType);
    print(json[0]['category']);
    int len = json.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          data += [json[i]['category']];
        }
      });

    var uriResponse2 = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/authority/',
      ),
    );

    var json2 = jsonDecode(uriResponse2.body);
    print(json[0]['authority']);
    int len2 = json.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len2 - 1; i++) {
          data2 += [json2[i]['authority']];
        }
      });

    // Get.to(
    //     DropboxText(
    //         // text: '',
    //         ),
    //     arguments: data);
    Get.toNamed("/punchList", arguments: [data, data2]);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 0);
  }
}
