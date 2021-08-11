import 'package:flutter/material.dart';
import 'package:list_view/src/utils/dropbox_text.dart';
import 'package:list_view/src/utils/textfield_text.dart';
import 'package:list_view/src/utils/title_text.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleText(
              title: 'Attachment',
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            DropboxText(text: 'Action On'),
            DropboxText(text: 'Discipline'),
            DropboxText(text: 'Raised On'),
            DropboxText(text: 'Target Date'),
            TextFieldText(text: 'Keyword', hint: 'Input Keyword'),
            _switch('Design Change Required'),
            _switch('Material Required'),
          ],
        ),
      ],
    );
  }

  Widget _switch(String text) {
    bool _isChecked = false;
    return Row(
      children: [
        SizedBox(
          child: Text(text),
        ),
        Switch(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value;
            });
          },
        )
      ],
    );
  }
}
