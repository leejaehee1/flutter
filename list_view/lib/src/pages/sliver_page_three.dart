import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_view/src/pages/components/image_picker.dart';
import 'package:list_view/src/utils/dropbox_text.dart';
import 'package:list_view/src/utils/textfield_text.dart';
import 'package:list_view/src/utils/title_text.dart';

import 'components/draft_screen.dart';

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
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.orange),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location'),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => DraftPage());
                },
                child: Text("View Drawing"),
              ),
            ],
          ),
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
