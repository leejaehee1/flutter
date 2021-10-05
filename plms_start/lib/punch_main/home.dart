import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../globals/login.dart' as login;
import '../globals/issue.dart' as issue;

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

  // get punchList data
  Future<dynamic> test() async {
    String authority = login.authority[0];
    var api = dotenv.env['PHONE_IP'];
    // var api = dotenv.env['EMUL_IP'];

    var categoryResponse = await http.get(
      Uri.parse("$api/summury/category/"),
    );

    var category = jsonDecode(categoryResponse.body);
    print(category.runtimeType);
    print(category[0]['category']);
    int len = category.length;
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          issue.categoryList += [category[i]['category']];
          issue.categoryNameList += [category[i]['categoryName']];
          issue.categoryDataList.add(
              "${category[i]['category'].toString()}\n${category[i]['categoryName'].toString()}");
        }
      });
///////////////////////////////
    var systemsResponse = await http.get(
      Uri.parse("$api/summury/systems/"),
    );

    var systems = jsonDecode(systemsResponse.body);
    print(systems[0]['systems']);
    int len2 = systems.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len2; i++) {
          issue.systemsList += [systems[i]['systemID']];
          issue.systemsNameList += [systems[i]['systemName']];
          issue.systemsDataList.add(
              "${systems[i]['systemID'].toString()}\n${systems[i]['systemName'].toString()}");
        }
      });
/////////////////////////////
    var subsystemResponse = await http.get(
      Uri.parse("$api/summury/subsystem/"),
    );

    var subsystem = jsonDecode(subsystemResponse.body);
    print(subsystem[0]['subsystem']);
    int len3 = subsystem.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len3; i++) {
          issue.subsystemList += [subsystem[i]['subsystem']];
          issue.subsystemNameList += [subsystem[i]['subsystemName']];
          issue.subsystemDataList.add(
              "${subsystem[i]['subsystem'].toString()}\n${subsystem[i]['subsystemName'].toString()}");
        }
      });
////////////////////////
    var disciplineResponse = await http.get(
      Uri.parse("$api/summury/discipline/"),
    );

    var discipline = jsonDecode(disciplineResponse.body);
    print(discipline[0]['discipline']);
    int len4 = discipline.length;
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len4; i++) {
          issue.disciplineList += [discipline[i]['discipline']];
          issue.disciplineNameList += [discipline[i]['disciplineName']];
          issue.disciplineDataList.add(
              "${discipline[i]['discipline'].toString()}\n${discipline[i]['disciplineName'].toString()}");
        }
      });

    var unitResponse = await http.get(
      Uri.parse("$api/summury/unit/"),
    );

    var unit = jsonDecode(unitResponse.body);
    print(unit[0]['unit']);
    int len5 = unit.length;
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len5; i++) {
          issue.unitList += [unit[i]['unit']];
          issue.unitNameList += [unit[i]['unitName']];
          issue.unitDataList.add(
              "${unit[i]['unit'].toString()}\n${unit[i]['unitName'].toString()}");
        }
      });

    var areaResponse = await http.get(
      Uri.parse("$api/summury/area/"),
    );

    var area = jsonDecode(areaResponse.body);
    print(unit[0]['area']);
    int len6 = area.length;
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len6; i++) {
          issue.areaList += [area[i]['area']];
          issue.areaNameList += [area[i]['areaName']];
          issue.areaDataList.add(
              "${area[i]['area'].toString()}\n${area[i]['areaName'].toString()}");
        }
      });

    var departmentResponse = await http.get(
      Uri.parse(
          // 'http://10.0.2.2:5000/summury/discipline/',
          "$api/summury/department/"),
    );

    var department = jsonDecode(departmentResponse.body);
    print(department[0]['department']);
    int len7 = department.length;
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len7; i++) {
          issue.deptList += [department[i]['department']];
          issue.deptNameList += [department[i]['deptName']];
          issue.deptDataList.add(
              "${department[i]['department'].toString()}\n${department[i]['deptName'].toString()}");
        }
      });

    var qcResponse = await http.get(
      Uri.parse("$api/summury/userqc/"),
    );

    var qc = jsonDecode(qcResponse.body);
    print(qc[0]['userName']);
    int len8 = qc.length;
    // dispose();
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len8; i++) {
          issue.qcList += [qc[i]['userName']];
          // issue.systemsNameList += [qc[i]['systemName']];
          // issue.systemsDataList.add(
          //     "${qc[i]['userName'].toString()}\n${qc[i]['systemName'].toString()}");
        }
      });

    print(issue.categoryList);
    print('중간!!!!!!!!!!!!!!');
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

      Get.offAll(() => ScreenList());
    } else if (authority == "1") {
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

      Get.offAll(() => ScreenList());
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

      Get.offAll(() => ScreenList());
    }
    print('끝!!!!!!!!!!!!!!!!!!');
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: 1);
  }
}
