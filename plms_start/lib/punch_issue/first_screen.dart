import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'package:plms_start/pages/utils/title_text.dart';
import '../globals.dart' as globals;

/*
* name : PageOne
* description : punch issue first page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<String> category = Get.arguments[0];
  List<String> system = Get.arguments[1];
  List<String> subsystem = Get.arguments[2];

  String _horizonGroupValue = "Tag Number";
  List<String> _status = ['Tag Number', "Bulk Item"];
  bool _isTag = true;
  bool _isBulk = false;

  @override
  void initState() {
    globals.punch_issue_Category = [category[0]];
    globals.punch_issue_System = [system[0]];
    globals.punch_issue_Sub_System = [subsystem[0]];
    super.initState();
  }

  Widget _size15() {
    return SizedBox(
      height: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(10);
    return Container(
      // height: MediaQuery.of(context).size.height,
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
              height: MediaQuery.of(context).size.height,
              width: Get.width * 1 / 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
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
                                _radioButton(),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Column(
                                    children: [
                                      _textField2(
                                          'Tag Number', 'Create or Add'),
                                      _size15(),
                                      _textField3('Bulk Item', ''),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        _size15(),
                        _dropdownButton('Category', category),
                        _size15(),
                        _dropdownButton('System', system),
                        _size15(),
                        _dropdownButton('Sub-System', subsystem),
                        _size15(),
                        // _size15(),
                        _textField(
                            'Unit', 'Create or Add', globals.punch_issue_Unit),
                        _size15(),
                        _textField(
                            'Area', 'Create or Add', globals.punch_issue_Area),
                        _size15(),
                        _textFormField('Punch ID', 'Add'),
                        _size15(),

                        _description(globals.punch_issue_Description),
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

// 라디오 버튼
  Widget _radioButton() {
    return RadioGroup<String>.builder(
      activeColor: Colors.green,
      direction: Axis.horizontal,
      groupValue: _horizonGroupValue,
      onChanged: (value) => setState(() {
        _horizonGroupValue = value!;

        if (value == _status[0]) {
          _isTag = true;
          _isBulk = false;
        } else {
          _isTag = false;
          _isBulk = true;
        }
      }),
      items: _status,
      itemBuilder: (item) => RadioButtonBuilder(
        item,
        textPosition: RadioButtonTextPosition.left,
      ),
    );
  }

// description
  Widget _description(var globaldata) {
    return Column(
      children: [
        Row(
          children: [
            Text("Description"),
          ],
        ),
        Container(
          // height: 100,
          child: TextField(
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

// dropdown button
  Widget _dropdownButton(String text, var data) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 1 / 3.6,
          child: Text(text),
        ),
        SizedBox(
          width: Get.width * 2.7 / 5,
          height: Get.height * 1.1 / 25,
          // child: Newbutton(),
          child: DropdownSearch<String>(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: OutlineInputBorder(),
              // isDense: true,
              // isCollapsed: true,
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            dropDownButton: Icon(null),
            showSearchBox: true,
            mode: Mode.MENU,
            showSelectedItem: true,
            items: data,
            hint: "Menu mode",
            onChanged: (value) {
              // 1. global first, second, third 값을 모두 한방에 관리하는 방법
              // 2. punch_issue scope 에서만 사용하는 모델 또는 저장 객체를 두는 방법 => 적합
              // 3. 결론 : flutter 에 global key 활용

              print("confirm : " + value.toString());

              if (text == "Category") {
                globals.punch_issue_Category.removeAt(0);
                globals.punch_issue_Category.add(value.toString());
              } else if (text == "System") {
                globals.punch_issue_System.removeAt(0);
                globals.punch_issue_System.add(value.toString());
              } else if (text == "Sub-System") {
                globals.punch_issue_Sub_System.removeAt(0);
                globals.punch_issue_Sub_System.add(value.toString());
              }
              print("global 테스트");
              // print(value.);
              print(globals.punch_issue_Category);
              print(globals.punch_issue_System);
              print(globals.punch_issue_Sub_System);
            },
            selectedItem: data[0],
          ),
        ),
      ],
    );
  }

// textfield
  Widget _textField(String text, String hint, var globaldata) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 160,
          height: 30,
          child: TextField(
              maxLines: 1,
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
              // controller: controller,
              decoration: InputDecoration(
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
                // autofocus: true,
                // visualDensity: VisualDensity(
                //   vertical: 2.5,
                //   horizontal: 2.5,
                // ),
                onPressed: () {
                  print(globals.punch_issue_Unit);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))),
      ],
    );
  }

  Widget _textFormField(String text, String hint) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 195,
          height: 30,
          child: TextFormField(
              enabled: _isTag,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                hintText: hint,
              )),
        ),
      ],
    );
  }

// textfield tag number
  Widget _textField2(String text, String hint) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 122,
          height: 30,
          child: TextField(
              enabled: _isTag,
              decoration: InputDecoration(
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
                // autofocus: true,
                // visualDensity: VisualDensity(
                //   vertical: 2.5,
                //   horizontal: 2.5,
                // ),
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))),
      ],
    );
  }

// textfield bulk
  Widget _textField3(String text, String hint) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 157,
          height: 30,
          child: TextField(
              enabled: _isBulk,
              decoration: InputDecoration(
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
