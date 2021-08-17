import 'package:flutter/material.dart';

class DropboxText extends StatelessWidget {
  String text;

  DropboxText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(text),
        ),
        TextButton(onPressed: () {}, child: Text('Dropdown Position')),
      ],
    );
  }
}
