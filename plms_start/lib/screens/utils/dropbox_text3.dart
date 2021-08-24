import 'package:flutter/material.dart';

import 'dropdown_button3.dart';

class DropboxText3 extends StatelessWidget {
  final String text;

  DropboxText3({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(text),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 4 / 7,
          height: 50,
          child: DropdownButtonWidget3(),
        ),
      ],
    );
  }
}
