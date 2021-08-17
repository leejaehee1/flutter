import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plms_start/pages/home.dart';

import 'pages/confirm_page.dart';
import 'pages/login_pages.dart';
import 'pages/punch_screen.dart';
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
      // initialBinding: BindingsBuilder(() {
      //   Get.put(DropdownButtonController());
      // }),

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
        // GetPage(
        //   name: '/binding',
        //   page: () => BindingPage(),
        //   binding: BindingPageBinding(),
        // ),
      ],
    );
  }
}
