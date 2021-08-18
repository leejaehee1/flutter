import 'package:flutter/material.dart';
import 'dropdown_button6.dart';

class DropboxText6 extends StatelessWidget {
  String text;

  DropboxText6({Key? key, required this.text}) : super(key: key);

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
          child: DropdownButtonWidget6(),
        ),
      ],
    );
  }
}
