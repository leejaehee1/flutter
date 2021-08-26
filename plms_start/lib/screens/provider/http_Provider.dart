import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import 'package:plms_start/screens/models/model.dart';

const url = 'http://10.0.2.2:5000/api/';

class Server {
  // Future<dynamic> getReq() async {
  //   var uriResponse = await http.get(
  //     Uri.parse(
  //       'http://10.0.2.2:5000/api/category/',
  //     ),
  //   );

  //   var json = jsonDecode(uriResponse.body);
  //   var user = User.fromJson(json);
  //   print('시작');
  //   print(user);
  // }
  Future<dynamic> getReq(String title) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("url$title");
    print("시작");
    print(response.data.toString());
  }
}

Server server = Server();

// void initState() {
//   // getJsons();
//   test();
//   super.initState();
// }

// // dynamic getJsons() {
// //   Network network = Network("http://10.0.2.2:5000/api/category/");

// //   var resultData = network.getJsonData();
// //   print(resultData);
// // }

// dynamic test() async {
//   var uriResponse = await http.get(
//     Uri.parse(
//       'http://10.0.2.2:5000/api/category/',
//     ),
//   );

//   var json = jsonDecode(uriResponse.body);
//   var user = User.fromJson(json);
//   var a = user.result[0]['category'];
//   var b = user.result[1]['category'];
//   print(a);
//   print(a.runtimeType);
//   Get.toNamed("/punchList", arguments: a);

//   print(a);
// }
