import 'package:flutter/material.dart';
import 'package:quran_app/views/home/widgets/bottomnavbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: kCustomBottomNavBar(
        index: 2,
      ),
      body: Center(
        child: Text("Profile"),
      ),
    ));
  }
}
