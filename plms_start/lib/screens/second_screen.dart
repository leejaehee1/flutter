import 'package:date_time_picker/date_time_picker.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/screens/utils/swich_punch.dart';
// import 'utils/dropbox_text.dart';
import 'utils/dropbox_text4.dart';
import 'utils/dropbox_text5.dart';
import 'utils/dropbox_text6.dart';
import 'utils/dropbox_text7.dart';
import 'utils/tagging_text.dart';
// import 'utils/textfield_text.dart';
import 'utils/title_text.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List actionon = Get.arguments[3];
  List discipline = Get.arguments[2];
  List raisedon = Get.arguments[1];

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
              height: MediaQuery.of(context).size.height * 1.7 / 3,
              width: Get.width * 1 / 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1.7 / 3,
              width: Get.width - Get.width * 1 / 8,
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
                        TaggingButton(name: 'Keyword'),
                        _size15(),
                        SwitchButton(
                          name: 'Design Change Required',
                        ),
                        _size15(),
                        SwitchButton(
                          name: 'Material Required',
                        ),
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

  // Widget _switch(String text) {
  //   bool _isChecked = false;
  //   return Row(
  //     children: [
  //       SizedBox(
  //         child: Text(text),
  //       ),
  //       Switch(
  //         value: _isChecked,
  //         onChanged: (value) {
  //           setState(() {
  //             _isChecked = value;
  //           });
  //         },
  //       )
  //     ],
  //   );
  // }
}
