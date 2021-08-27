import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:plms_start/screens/models/model.dart';
import 'package:plms_start/screens/provider/http_Provider.dart';
import 'package:plms_start/screens/utils/dropdown_button_new.dart';
import 'dart:convert';

import 'dropdown_button.dart';

class DropboxText extends StatefulWidget {
  final String text;

  DropboxText({Key? key, required this.text}) : super(key: key);

  @override
  _DropboxTextState createState() => _DropboxTextState();
}

class _DropboxTextState extends State<DropboxText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.text),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 4 / 7,
          height: 50,
          child: Newbutton(),
        ),
      ],
    );
  }
}
