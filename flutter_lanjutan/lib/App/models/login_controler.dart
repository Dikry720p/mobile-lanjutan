import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_lanjutan/Home_page.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var user = {}.obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  Future<void> login() async {
    var url = Uri.https('dummyjson.com', 'auth/login');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'username': email.value,
        'password': password.value,
        'expiresInMins': 30,
      }),
    );
    print('Response body: ${response.body}');

    var userData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(userData));
      await prefs.setString('fristname', jsonEncode(userData));
      Get.off(HomePage());
    } else {
      Get.snackbar('Error', response.body);
    }
  }
}
