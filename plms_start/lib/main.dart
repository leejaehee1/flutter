import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/components/photoList.dart';
import 'package:plms_start/pages/home.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller3.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller4.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller5.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller6.dart';
import 'package:plms_start/screens/controller/dropdown_button_controller7.dart';

import 'pages/components/punch_complete.dart';
import 'pages/confirm_page.dart';
import 'pages/login_pages.dart';
import 'pages/punch_screen.dart';
import 'pages/success_page.dart';
import 'screens/controller/dropdown_button_controller.dart';
import 'screens/controller/dropdown_button_controller2.dart';
import 'screens/utils/draft_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Home(),
      initialRoute: '/',
      initialBinding: BindingsBuilder(() {
        Get.put(DropdownButtonController());
        Get.put(DropdownButtonController2());
        Get.put(DropdownButtonController3());
        Get.put(DropdownButtonController4());
        Get.put(DropdownButtonController5());
        Get.put(DropdownButtonController6());
        Get.put(DropdownButtonController7());
      }),

      getPages: [
        GetPage(
            name: '/', page: () => LoginPage(), transition: Transition.zoom),
        GetPage(name: '/home', page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: '/punchList',
            page: () => PunchScreen(),
            transition: Transition.zoom),
        GetPage(
            name: '/draft',
            page: () => DraftPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/confirm',
            page: () => ConfirmPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/success',
            page: () => SuccessPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/photoList',
            page: () => PhotoList(),
            transition: Transition.zoom),
        GetPage(
            name: '/complete',
            page: () => PunchComplete(),
            transition: Transition.zoom),
      ],
    );
  }
}
