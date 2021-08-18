import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              print(isSwitched);
            });
          },
          activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
      ],
    );
  }
}
