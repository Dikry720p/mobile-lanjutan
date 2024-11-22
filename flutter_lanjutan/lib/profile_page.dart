import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lanjutan/App/models/user.dart';
import 'package:flutter_lanjutan/Home_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('emilys'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan background
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_photo.jpg'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 15),
                    Obx(() {
                      final user = Get.find<HomeController>().profile.value;
                      return Text(
                        user.firstname ?? 'firstName',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Informasi profil
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildProfileItem(
                    icon: Icons.email,
                    title: 'Email',
                    value: 'user@example.com',
                  ),
                  _buildProfileItem(
                    icon: Icons.phone,
                    title: 'Telepon',
                    value: '+62 812-3456-7890',
                  ),
                  _buildProfileItem(
                    icon: Icons.location_on,
                    title: 'Alamat',
                    value: 'Jakarta, Indonesia',
                  ),

                  SizedBox(height: 30),

                  // Tombol edit profil
                  ElevatedButton.icon(
                    onPressed: () {
                      // Tambahkan fungsi edit profil di sini
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Edit Profil'),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
