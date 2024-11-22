import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lanjutan/App/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_lanjutan/profile_page.dart';
import 'package:flutter_lanjutan/dash.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_lanjutan/pages/energy_page.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  var currentIndex = 0.obs;
  var profile = User().obs;

  void increment() => count++;
  void changeIndex(int index) => currentIndex.value = index;

  Future<void> saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode({
      "accessToken": user.accessToken,
      "refreshtoken": user.refreshtoken,
      "id": user.id,
      "username": user.username,
      "email": user.email,
      "firstname": user.firstName,
      "lastname": user.lastname,
      "gender": user.gender,
      "image": user.image,
    });
    await prefs.setString('user', userJson);
  }

  void updateUser(User newUser) {
    profile.value = newUser; // Perbarui data pengguna
    saveUser(newUser); // Simpan ke SharedPreferences
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());

    // Define the pages for the ttomNavigationBar
    final List<Widget> pages = [
      MyDash(),
      EnergyMenu(),
      ProfilePage(),
    ];

    return Scaffold(
      body: Obx(() => pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: c.currentIndex.value,
          onTap: c.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            // BottomNavigationBarItem(icon: Icon(Icons.desk), label: "energy"),
            BottomNavigationBarItem(
                icon: Icon(Icons.energy_savings_leaf), label: "energy"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      ),
    );
  }
}
