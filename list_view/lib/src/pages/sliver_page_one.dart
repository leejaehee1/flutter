import 'package:flutter/material.dart';
import 'package:list_view/src/utils/dropbox_text.dart';
import 'package:list_view/src/utils/textfield_text.dart';
import 'package:list_view/src/utils/title_text.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "hint",
        )),
      ],
    );
  }
}
