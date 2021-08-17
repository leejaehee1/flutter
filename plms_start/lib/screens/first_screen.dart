import 'package:flutter/material.dart';
import 'package:plms_start/screens/utils/title_text.dart';

import 'utils/dropbox_text.dart';
import 'utils/textfield_text.dart';

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
                    DropboxText(text: 'Catagory'),
                    DropboxText(text: 'System'),
                    DropboxText(text: 'Sub-System'),
                    TextFieldText(text: 'Unit', hint: 'Create or Add'),
                    TextFieldText(text: 'Area', hint: 'Create or Add'),
                    TextFieldText(text: 'Punch ID', hint: 'Add'),
                    TextFieldText(text: 'Tag Number', hint: 'Create or Add'),
                    _bulk(),
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

  Widget _bulk() {
    bool _isChecked = false;
    return Row(
      children: [
        SizedBox(
          child: Text("Bulk Item"),
        ),
        Checkbox(
          checkColor: Colors.black,
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
              TextField();
            });
          },
        ),
      ],
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
          height: 190,
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLength: null,
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
