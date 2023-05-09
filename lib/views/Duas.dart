import 'package:flutter/material.dart';
import 'package:quran_app/views/home/widgets/bottomnavbar.dart';

class DuaScreen extends StatelessWidget {
  const DuaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: kCustomBottomNavBar(
        index: 1,
      ),
      body: Center(
        child: Text("Dua"),
      ),
    ));
  }
}
