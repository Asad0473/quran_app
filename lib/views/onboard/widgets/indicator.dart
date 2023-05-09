import 'package:flutter/material.dart';
import 'package:quran_app/utils/appDimensions.dart';
import 'package:quran_app/utils/spaces.dart';

class Indicator extends StatelessWidget {
  final bool isSelected;
  const Indicator({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: Space.hf(0.2),
      duration: const Duration(milliseconds: 150),
      width:
          isSelected ? AppDimensions.normalize(12) : AppDimensions.normalize(4),
      height: AppDimensions.normalize(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360.0),
        color: Colors.white,
      ),
    );
  }
}
