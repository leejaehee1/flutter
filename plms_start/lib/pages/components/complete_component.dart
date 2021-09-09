import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class CompleteComponent extends StatefulWidget {
  const CompleteComponent({Key? key}) : super(key: key);

  @override
  _CompleteComponentState createState() => _CompleteComponentState();
}

class _CompleteComponentState extends State<CompleteComponent> {
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dataWidget('Category', data['category']),
                _dataWidget('System', data['system']),
                _dataWidget('Sub-system', data['category']),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dataWidget('Unit', data['unit']),
                _dataWidget('Area', data['area']),
                _dataWidget('Tag Numger', data['category']),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 500,
          child: Divider(
            color: Color(0xff5D8791),
            thickness: 1.3,
          ),
        ),
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.completeText,
              style: TextStyle(color: Color(0xff5D8791)),
            ),
          ],
        )
      ],
    );
  }

  Widget _dataWidget(String title, var datas) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 2 / 7,
          // height: Get.height * 1 / 11,
          child: _textWidget(title),
        ),
        _textWidget(datas),
      ],
    );
  }

  Widget _textWidget(String data) {
    return Text(
      data,
      style: TextStyle(color: Colors.white),
    );
  }
}
