import 'package:flutter/material.dart';
import 'package:list_view/src/pages/components/image_picker.dart';
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
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleText(
              title: 'Attachment',
            ),
            _switch('Upload Images now'),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Text('Photo'),
              ],
            ),
            ImagePickers(),
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
