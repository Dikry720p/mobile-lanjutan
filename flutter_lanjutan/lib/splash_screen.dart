import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool showLogo = false;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Durasi animasi lingkaran
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Setelah animasi selesai, tampilkan logo dan teks
          setState(() {
            showLogo = true;
          });

          // Tunggu beberapa detik, lalu navigasi ke LoginPage
          Future.delayed(Duration(seconds: 2), () {
            Get.off(() => LoginPage());
          });
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double scale =
                    1.0 + (_controller.value * 10); // Pembesaran lingkaran
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                );
              },
            ),
            if (showLogo) ...[
              // Logo dan teks ditampilkan setelah animasi selesai
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Path logo yang diunggah
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sistem Monitoring dan Controlling Energi Listrik',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
