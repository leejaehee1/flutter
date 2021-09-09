import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropboxText extends StatefulWidget {
  final String text;

  DropboxText({Key? key, required this.text}) : super(key: key);

  @override
  _DropboxTextState createState() => _DropboxTextState();
}

class _DropboxTextState extends State<DropboxText> {
  List<String> data = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 1 / 3.6,
          child: Text(widget.text),
        ),
        SizedBox(
          width: Get.width * 2.7 / 5,
          height: Get.height * 1.3 / 25,
          // child: Newbutton(),
          child: _newButton(),
        ),
      ],
    );
  }

  Widget _newButton() {
    return DropdownSearch<String>(
        onSaved: print,
        showSearchBox: true,
        mode: Mode.MENU,
        showSelectedItem: true,
        items: data,
        label: "Menu mode",
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: print,
        selectedItem: data[0]);
  }
}
