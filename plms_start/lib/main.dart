import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'package:plms_start/app_config.dart';
import 'package:plms_start/pages/photoList.dart';
import 'package:plms_start/pages/home.dart';
import 'package:plms_start/pages/punch_modify.dart';
import 'package:plms_start/pages/sign_up_page.dart';
// import 'package:plms_start/screens/binding/init_binding.dart';
// import 'screens/controller/dropdown_button_controller.dart';
// import 'screens/controller/dropdown_button_controller2.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller3.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller4.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller5.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller6.dart';
// import 'package:plms_start/screens/controller/dropdown_button_controller7.dart';
import 'package:plms_start/screens/loading.dart';
import 'package:plms_start/screens/repository/data_repository.dart';

import 'pages/punch_complete.dart';
import 'pages/confirm_page.dart';
import 'pages/login_pages.dart';
import 'pages/punch_screen.dart';
import 'pages/success_page.dart';
import 'pages/utils/popup_page.dart';

import 'screens/utils/draft_screen.dart';

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
      initialBinding: BindingsBuilder(() {
        // InitBinding();
        Get.put(DataRepository(), permanent: true);
        //   Get.put(DropdownButtonController());
        //   Get.put(DropdownButtonController2());
        //   Get.put(DropdownButtonController3());
        //   Get.put(DropdownButtonController4());
        //   Get.put(DropdownButtonController5());
        //   Get.put(DropdownButtonController6());
        //   Get.put(DropdownButtonController7());
      }),

      getPages: [
        GetPage(
            name: '/', page: () => LoginPage(), transition: Transition.zoom),
        GetPage(
          name: '/home',
          page: () => Home(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/modify',
          page: () => ModifyPage(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/loading',
          page: () => Loading(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/punchList',
          page: () => PunchScreen(),
          transition: Transition.zoom,
        ),
        GetPage(
            name: '/popup',
            page: () => PopUpPage(),
            // transition: Transition.upToDown,
            opaque: false),
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
