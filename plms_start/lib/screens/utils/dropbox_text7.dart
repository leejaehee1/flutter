import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:plms_start/screens/models/model.dart';

import 'dart:convert';

class DropboxText7 extends StatefulWidget {
  final String text;

  DropboxText7({Key? key, required this.text}) : super(key: key);

  @override
  _DropboxTextState createState() => _DropboxTextState();
}

class _DropboxTextState extends State<DropboxText7> {
  List<String> data = [];

  dynamic test() async {
    var uriResponse = await http.get(
      Uri.parse(
        'http://10.0.2.2:5000/api/category/',
      ),
    );

    var json = jsonDecode(uriResponse.body);
    var user = User.fromJson(json);
    int len = user.result.length;
    if (mounted)
      this.setState(() {
        for (int i = 0; i < len; i++) {
          data += [user.result[i]['category']];
        }
      });
    // setState(() {
    //   for (int i = 0; i < len; i++) {
    //     data += [user.result[i]['category']];
    //   }
    // });
  }

  void initState() {
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.text),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 4 / 7,
          height: 50,
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
