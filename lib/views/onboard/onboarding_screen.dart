import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/controllers/onboarding_Controller.dart';
import 'package:quran_app/utils/app.dart';
import 'package:quran_app/utils/spaces.dart';
import 'package:quran_app/utils/static_assets.dart';
import 'package:quran_app/views/home/homepage.dart';
import 'package:quran_app/views/onboard/widgets/onboarding_page.dart';

import 'widgets/indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  List<Widget> pages = [
    const OnBoardingPage(
      image: StaticAssets.gradLogo,
      text:
          "The Holy Qur'an\n\n\"Indeed, It is We who sent down the Qur'an and indeed, We will be its Guardian\"\n",
    ),
    const OnBoardingPage(
      image: StaticAssets.onboard2,
      text:
          "With sleek & awesome User Interface to keep you in love with this amazing app and the Book.\n\nHope you will like our efforts!\n",
    ),
    const OnBoardingPage(
      image: StaticAssets.onboard3,
      text:
          "Now with Surah & Juz Index you can find your required Surahs & Juzs easily.\n\nWith Bookmark option you can access your daily readings.\n",
    ),
    const OnBoardingPage(
      image: StaticAssets.onboardstar,
      text:
          "For the first time ever, we introduced a very unique experience for our users with 3D Drawer.\n\nCan't wait for your reviews :)\n",
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<OnBoardingController>().index = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    Object? args = ModalRoute.of(context)?.settings.arguments;

    return SafeArea(
      child: GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: (onBoardingProvider) {
          return Scaffold(
            backgroundColor: Color(0xFF163141),
            body: Stack(
              children: [
                PageView(
                  onPageChanged: (int value) =>
                      onBoardingProvider.index = value,
                  controller: _pageController,
                  children: pages.asMap().entries.map((e) {
                    return e.value;
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: Space.all(0.5, 2),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      child: const Text('Skip'),
                      onPressed: () {
                        // if (args != null && (args as Map)['route'] == 'drawer') {
                        //   Navigator.pop(context);
                        // } else {
                        //   Navigator.pushReplacementNamed(context, '/home');
                        // }
                        Get.to(() => HomeScreen());
                      },
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: Row(
              children: [
                Space.x2!,
                ...pages.asMap().entries.map(
                      (e) => Indicator(
                        isSelected: onBoardingProvider.index == e.key,
                      ),
                    ),
                Space.xm!,
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: onBoardingProvider.index == pages.length - 1
                      ? const Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                  onPressed: () {
                    if (onBoardingProvider.index == pages.length - 1) {
                      if (args != null && (args as Map)['route'] == 'drawer') {
                        Navigator.pop(context);
                      } else {
                        Get.to(() => HomeScreen());
                      }
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
