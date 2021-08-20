import 'package:flutter/material.dart';

class TextFieldRegister extends StatelessWidget {
  String text;

  TextFieldRegister({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 200,
          height: 30,
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
          )),
        ),
      ],
    );
  }
}
