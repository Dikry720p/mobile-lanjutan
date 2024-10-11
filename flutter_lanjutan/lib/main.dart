import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Orang lain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(SplashScreenController());
      }),
    );
  }
}
