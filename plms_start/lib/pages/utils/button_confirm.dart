import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../punch_screen.dart';

class ConfirmButton extends StatefulWidget {
  ConfirmButton(
      {Key? key,
      // required this.name,
      required this.buttonname1,
      required this.buttonname2,
      required this.buttonname3})
      : super(key: key);
  // String name;
  final String buttonname1;
  final String buttonname2;
  final String buttonname3;
  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  var buttonWidth = Get.width * 1 / 3.5;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff71838D),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(widget.buttonname1),
            ),
          ),
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff71838D),
              ),
              onPressed: () {
                _showDialog('/home');
              },
              child: Text(widget.buttonname2),
            ),
          ),
          Container(
            width: buttonWidth,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff2F4C5A), // background
                // onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Get.offAllNamed("/success");
              },
              child: Text(widget.buttonname3),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(String page) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(
              "Are you sure you want to Cancel? \n Changes that you made may not be saved"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff71838D),
                  ),
                  child: new Text("No"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2F4C5A), // background
                    // onPrimary: Colors.white, // foreground
                  ),
                  child: new Text("Yes"),
                  onPressed: () {
                    setState(() {});
                    Get.toNamed(page);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
