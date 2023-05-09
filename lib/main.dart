import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/Bindings/AppBindings.dart';
import 'package:quran_app/views/splashScreen.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quran App',
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: Splash_Screen(),
    );
  }
}