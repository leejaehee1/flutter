import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dropdown_search/dropdown_search.dart';
// import 'package:group_radio_button/group_radio_button.dart';

import 'package:plms_start/pages/utils/title_text.dart';
import '../globals/globals.dart' as globals;
import '../globals/issue.dart' as issue;
// import '../globals/login.dart' as login;
import '../globals/punch_draft.dart' as draft;
/*
* name : ontap_one_other
* description : other first page
* writer : walter
* create date : 2021-09-30
* last update : 2021-10-20
* */

class OntapFirst extends StatefulWidget {
  OntapFirst({Key? key}) : super(key: key);

  @override
  _OntapFirstState createState() => _OntapFirstState();
}

class _OntapFirstState extends State<OntapFirst> {
  List<String> category = issue.categoryDataList;
  List<String> system = issue.systemsDataList;
  List<String> subsystem = issue.subsystemDataList;

  int idx = Get.arguments[0];
  List datas = Get.arguments[1];

  @override
  void initState() {
    super.initState();
  }

  var edge = EdgeInsets.fromLTRB(5, 10, 0, 0);

  final _tagTextEditController =
      Get.arguments[1][Get.arguments[0]]['tagNumber'] == null
          ? TextEditingController()
          : TextEditingController(
              text: Get.arguments[1][Get.arguments[0]]['tagNumber']);
  final _bulkTextEditController =
      Get.arguments[1][Get.arguments[0]]['bulkName'] == null
          ? TextEditingController()
          : TextEditingController(
              text: Get.arguments[1][Get.arguments[0]]['bulkName']);

  final _unitTextEditController = Get.arguments[1][Get.arguments[0]]['unit'] ==
          null
      ? TextEditingController()
      : TextEditingController(text: Get.arguments[1][Get.arguments[0]]['unit']);

  final _areaTextEditController = Get.arguments[1][Get.arguments[0]]['area'] ==
          null
      ? TextEditingController()
      : TextEditingController(text: Get.arguments[1][Get.arguments[0]]['area']);

  final _punchTextEditController =
      Get.arguments[1][Get.arguments[0]]['punchID'] == null
          ? TextEditingController()
          : TextEditingController(
              text: Get.arguments[1][Get.arguments[0]]['punchID']);

  final _descrpitionTextEditController =
      Get.arguments[1][Get.arguments[0]]['issueDescription'] == null
          ? TextEditingController()
          : TextEditingController(
              text: Get.arguments[1][Get.arguments[0]]['issueDescription']);

  Widget _size15() {
    return SizedBox(
      height: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(10);
    return Container(
      color: Color(0xFFE6E6E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffB7C5B9),
                borderRadius:
                    BorderRadius.only(topLeft: radius, bottomLeft: radius),
              ),
              height: Get.height + Get.height * 0.05,
              width: Get.width * 1 / 50,
            ),
            Container(
              height: Get.height + Get.height * 0.05,
              width: Get.width - Get.width * 0.83 / 8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topRight: radius, bottomRight: radius),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffB7C5B9),
                    offset: Offset(0, 0.3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TitleText(
                          title: 'General Infomation',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                // _radioButton(),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Column(
                                    children: [
                                      _textField2(
                                          'Tag Number',
                                          'Create or Add',
                                          globals.punch_issue_Tag_Number,
                                          _tagTextEditController),
                                      _size15(),
                                      _textField3(
                                          'Bulk Name',
                                          '',
                                          globals.punch_issue_Bulk_Name,
                                          _bulkTextEditController),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        _size15(),
                        _dropdownButton('Category', category,
                            issue.categoryList, 'category'),
                        _size15(),
                        _dropdownButton(
                            'System', system, issue.systemsList, 'systemID'),
                        _size15(),
                        _dropdownButton('Sub-System', subsystem,
                            issue.subsystemList, 'subsystem'),
                        _size15(),
                        // _size15(),
                        _unittextField('Unit', 'Create or Add',
                            draft.punch_issue_Unit, _unitTextEditController),
                        _size15(),
                        _areatextField('Area', 'Create or Add',
                            draft.punch_issue_Area, _areaTextEditController),
                        _size15(),
                        _textFormField(
                            'Punch ID',
                            'Add',
                            draft.punch_issue_Punch_ID,
                            _punchTextEditController),
                        _size15(),

                        _description(draft.punch_issue_Description,
                            _descrpitionTextEditController),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// description
  Widget _description(var globaldata, var controller) {
    return Column(
      children: [
        Row(
          children: [
            Text("Description"),
          ],
        ),
        Container(
          child: TextField(
              enabled: false,
              controller: controller,
              onChanged: (String str) {
                setState(() {
                  if (globaldata.length == 0) {
                    globaldata.add(str);
                  } else {
                    globaldata.removeAt(0);
                    globaldata.add(str);
                  }
                });
              },
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              maxLength: 100,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "hint",
                isDense: true,
              )),
        ),
      ],
    );
  }

// category system subsystem ???????????? ??????
  Widget _dropdownButton(String text, var data1, var data2, String text2) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 1 / 3.6,
          child: Text(text),
        ),
        SizedBox(
          width: Get.width * 2.7 / 5,
          height: Get.height * 1.1 / 25,
          child: DropdownSearch<String>(
            enabled: false,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: edge,
              border: OutlineInputBorder(),
              isDense: true,
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            dropDownButton: Icon(null),
            showSearchBox: true,
            mode: Mode.BOTTOM_SHEET,
            showSelectedItem: true,
            items: data1,
            hint: "Menu mode",
            onChanged: (value) {
              // 1. global first, second, third ?????? ?????? ????????? ???????????? ??????
              // 2. punch_issue scope ????????? ???????????? ?????? ?????? ?????? ????????? ?????? ?????? => ??????
              // 3. ?????? : flutter ??? global key ??????
              for (var i = 0; i < data1.length; i++) {
                if (value == data1[i]) {
                  setState(() {
                    value = data2[i];
                  });
                }
              }

              if (text == "Category") {
                draft.punch_issue_Category.removeAt(0);
                draft.punch_issue_Category.add(value.toString());
              } else if (text == "System") {
                draft.punch_issue_System.removeAt(0);
                draft.punch_issue_System.add(value.toString());
              } else if (text == "Sub-System") {
                draft.punch_issue_Sub_System.removeAt(0);
                draft.punch_issue_Sub_System.add(value.toString());
              }
            },
            selectedItem: datas[idx][text2] != null ? datas[idx][text2] : '',
          ),
        ),
      ],
    );
  }

// unit ????????????
  Widget _unittextField(
      String text, String hint, var globaldata, var controller) {
    return Row(
      children: [
        Container(width: Get.width * 1 / 3.6, child: Text(text)),
        SizedBox(
          width: Get.width * 2.2 / 5,
          height: Get.height * 1.1 / 25,
          child: TextField(
              enabled: false,
              controller: controller,
              maxLines: 1,
              onChanged: (String str) {
                setState(() {
                  if (globaldata.length == 0) {
                    globaldata.add(str);
                  } else {
                    globaldata.removeAt(0);
                    globaldata.add(str);
                  }
                });
              },
              decoration: InputDecoration(
                contentPadding: edge,
                isDense: true,
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                hintText: hint,
              )),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
            color: Colors.grey[500],
            width: 30,
            height: 30,
            child: IconButton(
                padding: EdgeInsets.all(4),
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))),
      ],
    );
  }

// area ????????????
  Widget _areatextField(
      String text, String hint, var globaldata, var controller) {
    return Row(
      children: [
        Container(width: Get.width * 1 / 3.6, child: Text(text)),
        SizedBox(
          width: Get.width * 2.2 / 5,
          height: Get.height * 1.1 / 25,
          child: TextField(
              enabled: false,
              controller: controller,
              maxLines: 1,
              onChanged: (String str) {
                setState(() {
                  if (globaldata.length == 0) {
                    globaldata.add(str);
                  } else {
                    globaldata.removeAt(0);
                    globaldata.add(str);
                  }
                });
              },
              // controller: controller,
              decoration: InputDecoration(
                contentPadding: edge,
                isDense: true,
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                hintText: hint,
              )),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
            color: Colors.grey[500],
            width: 30,
            height: 30,
            child: IconButton(
                padding: EdgeInsets.all(4),
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))),
      ],
    );
  }

  // punchID ????????????
  Widget _textFormField(
      String text, String hint, var globaldata, var controller) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Text(text)),
            _size15(),
            Container(
              width: Get.width * 4 / 5,
              height: Get.height * 1.1 / 25,
              child: TextFormField(
                  enabled: false,
                  controller: controller,
                  onChanged: (String str) {
                    setState(() {
                      if (globaldata.length == 0) {
                        globaldata.add(str);
                      } else {
                        globaldata.removeAt(0);
                        globaldata.add(str);
                      }
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: edge,
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                    hintText: hint,
                  )),
            ),
          ],
        ),
      ],
    );
  }

// tag number ????????????
  Widget _textField2(String text, String hint, var globaldata, var controller) {
    return Row(
      children: [
        Container(width: Get.width * 1 / 3.6, child: Text(text)),
        Container(
          width: Get.width * 2.2 / 5,
          height: Get.height * 1.1 / 25,
          child: TextField(
              enabled: false,
              controller: controller,
              onChanged: (String str) {
                setState(() {
                  if (globaldata.length == 0) {
                    globaldata.add(str);
                  } else {
                    globaldata.removeAt(0);
                    globaldata.add(str);
                  }
                  print('globaldata!!!!!!!!!!');
                  print(globaldata);
                });
              },
              // enabled: globals.punch_issue_isTag,
              decoration: InputDecoration(
                contentPadding: edge,
                isDense: true,
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                hintText: hint,
              )),
        ),
      ],
    );
  }

// bulk name ????????????
  Widget _textField3(String text, String hint, var globaldata, var controller) {
    return Row(
      children: [
        Container(width: Get.width * 1 / 3.6, child: Text(text)),
        Container(
          width: Get.width * 2.2 / 5,
          height: Get.height * 1.1 / 25,
          child: TextField(
              controller: controller,
              onChanged: (String str) {
                setState(() {
                  if (globaldata.length == 0) {
                    globaldata.add(str);
                  } else {
                    globaldata.removeAt(0);
                    globaldata.add(str);
                  }
                });
              },
              enabled: false,
              decoration: InputDecoration(
                contentPadding: edge,
                isDense: true,
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                hintText: hint,
              )),
        ),
      ],
    );
  }
}
