import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../login.dart' as login;

import 'package:plms_start/punch_main/punch_main.dart';

/*
* name : Home
* description : home page
* writer : john
* create date : 2021-09-30
* last update : 2021-09-30
* */
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    login.draftList = [];
    login.openList = [];
    login.reqList = [];
    login.closeList = [];

    test();
    super.initState();
  }

/*
  @override
  void dispose() {
    test();
    super.dispose();
  }
*/

  // get punchList data
  Future<dynamic> test() async {
    String authority = login.authority[0];
    // String id = Get.arguments[1];
    // String password = Get.arguments[2];
    // String userName = Get.arguments[3];
    // String email = Get.arguments[4];
    // String company = Get.arguments[5];
    // String personalID = Get.arguments[6] == null ? "" : Get.arguments[6];
    // String department = Get.arguments[7] == null ? "" : Get.arguments[7];

    // var draftList = [];
    // var openList = [];
    // var reqList = [];
    // var closeList = [];

    // var api = dotenv.env['PHONE_IP'];
    var api = dotenv.env['EMUL_IP'];

    if (authority == "3") {
      var uriResponse = await http.get(
        Uri.parse("$api/summury/sqlall/"),
      );
      var sqlall = jsonDecode(uriResponse.body);
      print(json.runtimeType);
      print('요기요');
      // sqlall += json;
      print("sqlall[0]: ${sqlall[0]}");
      if (mounted)
        setState(() {
          for (int i = 0; i < sqlall.length; i++) {
            if (sqlall[i]['status'] == "1") {
              login.draftList += [sqlall[i]];
            } else if (sqlall[i]['status'] == "2" ||
                sqlall[i]['status'] == "5") {
              login.openList += [sqlall[i]];
            } else if (sqlall[i]['status'] == "3" ||
                sqlall[i]['status'] == "4") {
              login.reqList += [sqlall[i]];
            } else if (sqlall[i]['status'] == '6') {
              login.closeList += [sqlall[i]];
            }

            print('되냐?');
            print("draftList: ${login.draftList}");
            print("openList: ${login.openList}");
            print("reqList: ${login.reqList}");
            print("closeList: ${login.closeList}");
            print("id: ${login.userID}");
            print('된다! 된다!');
          }
        });

      Get.offAll(
        () => ScreenList(),
        // arguments: [
        //   draftList,
        //   openList,
        //   reqList,
        //   closeList,
        //   id,
        //   password,
        //   userName,
        //   email,
        //   company,
        //   authority,
        //   personalID,
        //   department,
        // ]
      );
    } else if (authority == "1") {
      // var url = Uri.parse('http://172.30.1.42:5000/summury/sqlassi/');

      var url = Uri.parse('$api/summury/sqlassi/');
      var response = await http.post(url, body: {
        'userID': login.userID[0],
      });

      // print('sqlassi');
      // print(response.body);
      var sqlassi = jsonDecode(response.body);
      // print('json2$json2');

      if (mounted)
        this.setState(() {
          for (int i = 0; i < sqlassi.length; i++) {
            if (sqlassi[i]['status'] == "1") {
              login.draftList += [sqlassi[i]];
            } else if (sqlassi[i]['status'] == "2" ||
                sqlassi[i]['status'] == '5') {
              login.openList += [sqlassi[i]];
            } else if (sqlassi[i]['status'] == '3' ||
                sqlassi[i]['status'] == '4') {
              login.reqList += [sqlassi[i]];
            } else if (sqlassi[i]['status'] == '6') {
              login.closeList += [sqlassi[i]];
            }
            print('되냐?');
            print("draftList: ${login.draftList}");
            print("openList: ${login.openList}");
            print("reqList: ${login.reqList}");
            print("closeList: ${login.closeList}");
            print("id: ${login.userID}");
            print('된다! 된다!');
          }
        });

      Get.offAll(
        () => ScreenList(),
        // arguments: [
        //   draftList,
        //   openList,
        //   reqList,
        //   closeList,
        //   id,
        //   password,
        //   userName,
        //   email,
        //   company,
        //   authority,
        //   personalID,
        //   department,
        // ]
      );
    } else {
      var url = Uri.parse('$api/summury/sqlqc/');
      var response = await http.post(url, body: {
        'userID': login.userID[0],
      });
      var sqlqc = jsonDecode(response.body);
      // print('json3$json3');
      //  += json3;
      print("sqlassi[0]: ${sqlqc[0]}");
      if (mounted)
        this.setState(() {
          for (int i = 0; i < sqlqc.length; i++) {
            if (sqlqc[i]['status'] == '1') {
              login.draftList += [sqlqc[i]];
            } else if (sqlqc[i]['status'] == '2' || sqlqc[i]['status'] == '5') {
              login.openList += [sqlqc[i]];
            } else if (sqlqc[i]['status'] == '3' || sqlqc[i]['status'] == '4') {
              login.reqList += [sqlqc[i]];
            } else if (sqlqc[i]['status'] == '6') {
              login.closeList += [sqlqc[i]];
            }

            print('되냐?');
            print("draftList: ${login.draftList}");
            print("openList: ${login.openList}");
            print("reqList: ${login.reqList}");
            print("closeList: ${login.closeList}");
            print("id: ${login.userID}");
            print('된다! 된다!');
          }
        });

      Get.offAll(
        () => ScreenList(),
        // arguments: [
        //   draftList,
        //   openList,
        //   reqList,
        //   closeList,
        //   id,
        //   password,
        //   userName,
        //   email,
        //   company,
        //   authority,
        //   personalID,
        //   department,
        // ]
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 1);
  }
}
