import 'package:flutter/material.dart';
import 'package:plms_start/screens/utils/checkbox_punch.dart';
import 'package:plms_start/screens/utils/dropdown_button_new.dart';
import 'package:plms_start/screens/utils/new.Button.dart';
import 'package:plms_start/screens/utils/title_text.dart';

import 'data/network.dart';
import 'models/model.dart';
import 'utils/dropbox_text.dart';
import 'utils/dropbox_text2.dart';
import 'utils/dropbox_text3.dart';
import 'utils/textfield_text.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFE6E6E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xffB7C5B9),
                offset: Offset(-7, 0),
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
                    Newbutton(),
                    ButtonNew(),
                    // DropboxText(text: 'Catagory'),
                    // DropboxText2(text: 'System'),
                    // DropboxText3(text: 'Sub-System'),
                    TextFieldText(text: 'Unit', hint: 'Create or Add'),
                    TextFieldText(text: 'Area', hint: 'Create or Add'),
                    TextFieldText(text: 'Punch ID', hint: 'Add'),
                    TextFieldText(text: 'Tag Number', hint: 'Create or Add'),
                    CheckButton(name: 'Bulk Item'),
                    _description(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _description() {
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
              keyboardType: TextInputType.multiline,
              maxLines: 7,
              maxLength: 100,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "hint",
                isDense: true,
              )),
        ),
      ],
    );
  }
}
