import 'package:flutter/material.dart';

class TextFieldText extends StatelessWidget {
  String text;
  String hint;

  TextFieldText({Key? key, required this.text, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Text(text)),
        SizedBox(
          width: 250,
          height: 30,
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: hint,
          )),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    );
  }
}
