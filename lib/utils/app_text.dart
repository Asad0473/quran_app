import 'package:flutter/material.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h3;
  static TextStyle? h3b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2b;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static init() {
    const b = FontWeight.w600;
    const baseStyle = TextStyle();

    h1 = baseStyle.copyWith(
      fontSize: 20,
      color: Colors.black54,
    );
    h1b = h1!.copyWith(
      fontWeight: b,
      color: Colors.black54,
    );

    h2 = baseStyle.copyWith(
      fontSize: 14,
      color: Colors.black54,
    );
    h2b = h2!.copyWith(
      fontWeight: b,
      color: Colors.white,
    );

    h3 = baseStyle.copyWith(
      fontSize: 8,
      color: Colors.black54,
    );
    h3b = h3!.copyWith(
      fontWeight: b,
      color: Colors.black54,
    );

    b1 = baseStyle.copyWith(
      fontSize: 8,
      color: Colors.black54,
    );
    b1b = b1!.copyWith(
      fontWeight: b,
      color: Colors.black54,
    );

    b2 = baseStyle.copyWith(
      fontSize: 6,
      color: Colors.black54,
    );
    b2b = b2!.copyWith(
      fontWeight: b,
      color: Colors.black54,
    );

    l1 = baseStyle.copyWith(
      fontSize: 5,
      color: Colors.black54,
    );
    l1b = l1!.copyWith(
      fontWeight: b,
      color: Colors.black54,
    );

    l2 = baseStyle.copyWith(
      fontSize: 4,
      color: Colors.black54,
    );
    l2b = l2!.copyWith(
      fontWeight: b,
      color: Colors.black54,
    );
  }
}
