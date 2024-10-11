import 'package:flutter/material.dart';
import 'package:flutter_lanjutan/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter_lanjutan/dash.dart';
import 'package:flutter_lanjutan/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png',
                width: 150, height: 150), // Ganti dengan logo Anda
            SizedBox(height: 20),
            Text('Selamat Datang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 7), () {
      Get.off(() => Loginpage());
    });
  }
}
