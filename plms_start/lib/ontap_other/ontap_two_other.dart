import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:simple_tags/simple_tags.dart';

import '../pages/utils/title_text.dart';

import '../globals/globals.dart' as globals;
import '../globals/issue.dart' as issue;
import '../globals/login.dart' as login;
import '../globals/punch_draft.dart' as draft;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
/*
* name : PageTwo
* description : punch issue two page
* writer : walter
* create date : 2021-09-30
* last update : 2021-09-30
* */

class OntapSecond extends StatefulWidget {
  const OntapSecond({Key? key}) : super(key: key);

  @override
  _OntapSecondState createState() => _OntapSecondState();
}

class _OntapSecondState extends State<OntapSecond> {
  List actionon = issue.deptNameList;
  List discipline = issue.disciplineNameList;
  List raisedon = issue.qcList;

  bool isSwitch1 =
      login.draftList[Get.arguments[0]]['designChgReq'] == 1 ? true : false;
  bool isSwitch2 =
      login.draftList[Get.arguments[0]]['materialReq'] == 1 ? true : false;

  int idx = Get.arguments[0];

  List datas = Get.arguments[1];

  List<String> contentList = [];

  List<String> departmentDraft = [];
  List<String> disciplineDraft = [];

  @override
  void initState() {
    print('strat');
    for (var i = 0; i < 4; i++) {
      if (datas[idx]['keyword${i + 1}'] != null) {
        contentList.add(datas[idx]['keyword${i + 1}']);
      }
    }
    for (var i = 0; i < issue.deptList.length; i++) {
      if (datas[idx]['department'] != null &&
          datas[idx]['department'] == issue.deptList[i]) {
        departmentDraft.add(issue.deptNameList[i]);
      }
    }
    for (var i = 0; i < issue.disciplineList.length; i++) {
      if (datas[idx]['discipline'] != null &&
          datas[idx]['discipline'] == issue.disciplineList[i].toString()) {
        disciplineDraft.add(issue.disciplineNameList[i]);
      }
      print(disciplineDraft);
    }
    print('end!!!!!!!!!');
    super.initState();
  }

  final _tagTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(10);
    // final containerSize = _getSize(_heightKey);
    // double conHeight = containerSize.height;
    return Container(
      color: Color(0xFFE6E6E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffB7C5B9),
                  borderRadius:
                      BorderRadius.only(topLeft: radius, bottomLeft: radius),
                ),
                height: MediaQuery.of(context).size.height * 2.1 / 3,
                width: Get.width * 1 / 50,
              ),
            ),
            Container(
              // key: _heightKey,
              // height: 500,
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
                        _dropdownButton('Action On', actionon, issue.deptList,
                            "department"),
                        _size15(),
                        _dropdownButton('Discipline', discipline,
                            issue.disciplineList, 'discipline'),
                        _size15(),
                        _dropdownButton(
                            'Raised On', raisedon, issue.qcList, 'raisedBy'),
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
            enabled: false,
            dateMask: 'yyyy.MM.dd',
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(5, 15, 0, 0),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.arrow_drop_down),
              isDense: true,
            ),
            initialValue: datas[idx]['targetDate'],
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            // dateLabelText: 'Date',
            onChanged: (val) {
              setState(() {
                if (draft.punch_issue_Date.length == 0) {
                  draft.punch_issue_Date.add(val);
                } else {
                  draft.punch_issue_Date.removeAt(0);
                  draft.punch_issue_Date.add(val);
                }
                print('globaldata!!!!!!!!!!');
                print(draft.punch_issue_Date);
              });
            },
          ),
        ),
      ],
    );
  }

  // 드롭다운버튼 Row
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
          // child: Newbutton(),
          child: DropdownSearch<String>(
              enabled: false,
              dropdownSearchDecoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                border: OutlineInputBorder(),
                isDense: true,
                // isCollapsed: true,
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              dropDownButton: Icon(null),
              showSearchBox: true,
              mode: Mode.BOTTOM_SHEET,
              showSelectedItem: true,
              items: data1,
              // hint: "Menu mode",
              onChanged: (value) {
                // 1. global first, second, third 값을 모두 한방에 관리하는 방법
                // 2. punch_issue scope 에서만 사용하는 모델 또는 저장 객체를 두는 방법 => 적합
                // 3. 결론 : flutter 에 global key 활용

                print("confirm : " + value.toString());
                print("confirm : " + value.toString());
                for (var i = 0; i < data1.length; i++) {
                  if (value == data1[i]) {
                    setState(() {
                      value = data2[i];
                    });
                  }
                }
                if (text == "Action On") {
                  draft.punch_issue_Action_On.removeAt(0);
                  draft.punch_issue_Action_On.add(value.toString());
                } else if (text == "Discipline") {
                  draft.punch_issue_Discipline.removeAt(0);
                  draft.punch_issue_Discipline.add(value.toString());
                } else if (text == "Raised On") {
                  draft.punch_issue_Raised_On.removeAt(0);
                  draft.punch_issue_Raised_On.add(value.toString());
                }
                print("global 테스트");
                // print(value.);
                print(draft.punch_issue_Action_On);
                print(draft.punch_issue_Discipline);
                print(draft.punch_issue_Raised_On);
              },
              selectedItem: text == "Action On" &&
                      datas[idx]['department'] != null
                  ? departmentDraft[0]
                  : text == "Discipline" && datas[idx]['discipline'] != null
                      ? disciplineDraft[0]
                      : text == "Raised On" && datas[idx]['raisedBy'] != null
                          ? datas[idx]['raisedBy']
                          : ''

              // datas[idx][text2],
              ),
        ),
      ],
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
            // setState(() {
            //   isSwitch1 = valued!;
            //   print(isSwitch1);
            //   if (draft.punch_issue_Design.length == 0) {
            //     if (isSwitch1 == true) {
            //       draft.punch_issue_Design.add('1');
            //     } else {
            //       draft.punch_issue_Design.add('0');
            //     }
            //   } else {
            //     draft.punch_issue_Design.removeAt(0);
            //     if (isSwitch1 == true) {
            //       draft.punch_issue_Design.add('1');
            //     } else {
            //       draft.punch_issue_Design.add('0');
            //     }
            //   }
            // }
            // );
            print(draft.punch_issue_Design);
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
            // setState(() {
            //   isSwitch2 = valued!;
            //   print(isSwitch2);
            //   if (draft.punch_issue_Material.length == 0) {
            //     if (isSwitch2 == true) {
            //       draft.punch_issue_Material.add('1');
            //     } else {
            //       draft.punch_issue_Material.add('0');
            //     }
            //   } else {
            //     draft.punch_issue_Material.removeAt(0);
            //     if (isSwitch2 == true) {
            //       draft.punch_issue_Material.add('1');
            //     } else {
            //       draft.punch_issue_Material.add('0');
            //     }
            //   }
            // });
            // print(draft.punch_issue_Material);
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
            enabled: false,
            style: TextStyle(fontSize: 17),
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(5, 15, 0, 0),
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
              // if (contentList.length > 3) {
              //   _showDialog();
              // } else {
              //   contentList.add(controller.text);
              //   controller.clear();
              // }

              // draft.punch_issue_Keyword = [];
              // draft.punch_issue_Keyword = contentList;

              // setState(() {
              //   print(draft.punch_issue_Keyword);
              // });
            },
          ),
        )
      ],
    );
  }

// keyword 4개이상 에러 문구
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("You can't use more than 4 keywords."),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D),
                  ),
                  child:
                      new Text(AppLocalizations.of(context)!.loginDialogButton),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        );
      },
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
            Expanded(
              child: SimpleTags(
                // wrapDirection: Axis.vertical,
                // tagTextOverflow: TextOverflow.fade,
                content: contentList,
                // wrapSpacing: 4,
                // wrapRunSpacing: 4,
                // onTagPress: (tag) {
                //   setState(() {});
                //   contentList.remove(tag);
                //   draft.punch_issue_Keyword = [];
                //   draft.punch_issue_Keyword = contentList;
                //   print('pressed $tag');
                //   print(draft.punch_issue_Keyword);
                // },
                tagContainerPadding: EdgeInsets.all(6),
                tagTextStyle: TextStyle(color: Colors.black),
                // tagIcon: Icon(Icons.clear, size: 12),
                tagContainerDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
