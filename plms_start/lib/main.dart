import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'package:plms_start/punch_main/punch_photo.dart';
import 'package:plms_start/punch_main/home.dart';
import 'package:plms_start/modify/punch_modify.dart';
import 'package:plms_start/signup/sign_up_page.dart';
import 'package:plms_start/punch_issue/loading.dart';

import 'punch_main/punch_complete.dart';
import 'punch_success/confirm_page.dart';
import 'login/login_pages.dart';
import 'punch_issue/punch_issue.dart';
import 'punch_success/success_page.dart';
import 'modify/popup_page.dart';
import 'punch_issue/draft_screen.dart';

import 'globals/globals.dart' as globals;

/*
* name : main
* description : This is a start page.
* writer : john
* create date : 2021-09-30
* last update : 2021-09-30
* */
Future<void> main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nanum',
      ),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      // home: Home(),
      initialRoute: '/',

      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
        ),
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
        GetPage(
            name: '/popup',
            page: () => PopUpPage(),
            // transition: Transition.upToDown,
            opaque: false),
        GetPage(
          name: '/modify',
          page: () => ModifyPage(),
        ),
        GetPage(
          name: '/photoList',
          page: () => PhotoList(),
        ),
        GetPage(
          name: '/complete',
          page: () => PunchComplete(),
        ),
        GetPage(
          name: '/loading',
          page: () => Loading(),
          opaque: false,
        ),
        GetPage(
          name: '/punchList',
          page: () => PunchScreen(),
        ),
        GetPage(
          name: '/draft',
          page: () => DraftPage(),
        ),
        GetPage(
          name: '/confirm',
          page: () => ConfirmPage(),
        ),
        GetPage(
          name: '/success',
          page: () => SuccessPage(),
        ),
      ],
    );
  }
}
