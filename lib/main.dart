import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   // systemNavigationBarColor: Color(0xFF2aa74b), // navigation bar color
  //   // // status bar color
  //   // statusBarIconBrightness: Brightness.light,
  //   statusBarColor: Colors.white,
  // ));

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
