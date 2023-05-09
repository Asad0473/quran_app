import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_text.dart';
import 'package:quran_app/utils/spaces.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String text;
  const OnBoardingPage({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 150,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    text,
                    style: AppText.h2b,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Space.y2!,
        ],
      ),
    );
  }
}
