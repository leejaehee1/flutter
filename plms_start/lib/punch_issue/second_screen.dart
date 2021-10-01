import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:simple_tags/simple_tags.dart';

import '../pages/utils/title_text.dart';

/*
* name : PageTwo
* description : punch issue two page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List actionon = Get.arguments[3];
  List discipline = Get.arguments[3];
  List raisedon = Get.arguments[1];

  bool isSwitch1 = false;
  bool isSwitch2 = false;

  List<String> contentList = [];

  final _tagTextEditController = TextEditingController();

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
              height: MediaQuery.of(context).size.height * 2.1 / 3,
              width: Get.width * 1 / 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2.1 / 3,
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
                          title: 'Assign',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        _dropdownButton('Action On', actionon),
                        _size15(),
                        _dropdownButton('Discipline', discipline),
                        _size15(),
                        _dropdownButton('Raised On', raisedon),
                        _size15(),
                        _dataTime('Target Date'),
                        _size15(),
                        // TaggingButton(name: 'Keyword'),
                        _tagWidget('keyword', _tagTextEditController),
                        SizedBox(
                          height: 30,
                        ),
                        _lineWidget(),
                        _size15(),
                        _swichsButton('Design Change Required'),
                        // _size15(),
                        _swichsButton2('Material Required'),
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

  // 높이 15 박스
  Widget _size15() {
    return SizedBox(
      height: 15,
    );
  }

  // line container
  Widget _lineWidget() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(border: Border.all(width: 0.3)),
    );
  }

  // 달력 날짜 선택
  Widget _dataTime(String text) {
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
          child: DateTimePicker(
            dateMask: 'yyyy.MM.dd',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.arrow_drop_down),
              isDense: true,
            ),
            initialValue: DateTime.now().toString(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            // dateLabelText: 'Date',
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
          ),
        ),
      ],
    );
  }

  //button row
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
          child: _newButton(data),
        ),
      ],
    );
  }

  // 드롭다운 버튼
  Widget _newButton(var data) {
    return DropdownSearch<String>(
      dropdownSearchDecoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        border: OutlineInputBorder(),
        isDense: true,
        // isCollapsed: true,
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      dropDownButton: Icon(null),
      showSearchBox: true,
      mode: Mode.MENU,
      showSelectedItem: true,
      items: data,
      hint: "Menu mode",
      onChanged: print,
      selectedItem: data[0],
    );
  }

  // 체크박스 버튼 디자인
  Widget _swichsButton(String title) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 250,
          child: Text(title),
        ),
        Checkbox(
          value: isSwitch1,
          onChanged: (valued) {
            setState(() {
              isSwitch1 = valued!;
              print(isSwitch1);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.green,
        ),
      ],
    );
  }

  // 체크박스 버튼 material
  Widget _swichsButton2(String title) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 250,
          child: Text(title),
        ),
        Checkbox(
          value: isSwitch2,
          onChanged: (valued) {
            setState(() {
              isSwitch2 = valued!;
              print(isSwitch2);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.green,
        ),
      ],
    );
  }

  //textfield keyword
  Widget _textField(String title, var controller) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 1 / 3.6,
          child: Text(title),
        ),
        SizedBox(
          width: Get.width * 2.22 / 5,
          height: Get.height * 1.1 / 25,
          child: TextFormField(
            style: TextStyle(fontSize: 17),
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 16, 0, 0),
              border: OutlineInputBorder(),

              // helperText: helperText,
            ),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          width: Get.height * 1.1 / 25,
          height: Get.height * 1.1 / 25,
          color: Colors.grey,
          child: IconButton(
            color: Colors.white,
            padding: EdgeInsets.all(2),
            icon: Icon(Icons.add),
            onPressed: () {
              contentList.add(controller.text);
              controller.clear();
              setState(() {});
            },
          ),
        )
      ],
    );
  }

// tagwidget
  Widget _tagWidget(String text, var controller) {
    return Column(
      children: [
        _textField(text, controller),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: Get.width * 1 / 3.6,
            ),
            SimpleTags(
              content: contentList,
              // wrapSpacing: 4,
              // wrapRunSpacing: 4,
              onTagPress: (tag) {
                setState(() {});
                contentList.remove(tag);
                print('pressed $tag');
              },
              tagContainerPadding: EdgeInsets.all(6),
              tagTextStyle: TextStyle(color: Colors.black),
              tagIcon: Icon(Icons.clear, size: 12),
              tagContainerDecoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
