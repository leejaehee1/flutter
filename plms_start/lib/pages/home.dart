import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/screenList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenList(),
    );
  }
}
