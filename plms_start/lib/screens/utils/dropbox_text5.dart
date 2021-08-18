import 'package:flutter/material.dart';
import 'package:plms_start/screens/utils/dropdown_button5.dart';

class DropboxText5 extends StatelessWidget {
  String text;

  DropboxText5({Key? key, required this.text}) : super(key: key);

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
          child: DropdownButtonWidget5(),
        ),
      ],
    );
  }
}
