import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

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

// class SwichButton extends StatefulWidget {
//   SwichButton({Key? key, required this.name}) : super(key: key);
//   String name;
//   @override
//   _State createState() => _State();
// }

// class _State extends State<SwichButton> {
//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context, String name) {
//     return Row(
//       children: [
//         Text(name),
//         Switch(
//           value: isSwitched,
//           onChanged: (value) {
//             setState(() {
//               isSwitched = value;
//               print(isSwitched);
//             });
//           },
//           activeTrackColor: Colors.yellow,
//           activeColor: Colors.orangeAccent,
//         ),
//       ],
//     );
//   }
// }
