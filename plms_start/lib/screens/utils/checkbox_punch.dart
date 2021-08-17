import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  CheckButton({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        Checkbox(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value!;
              print(isSwitched);
            });
          },
          // activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
      ],
    );
  }
}
