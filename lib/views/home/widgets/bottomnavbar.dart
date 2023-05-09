import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/utils/static_assets.dart';
import 'package:quran_app/views/Duas.dart';
import 'package:quran_app/views/Profile.dart';
import 'package:quran_app/views/home/homepage.dart';

class kCustomBottomNavBar extends StatefulWidget {
  final int? index;

  kCustomBottomNavBar({this.index = 0});

  @override
  State<kCustomBottomNavBar> createState() => _kCustomBottomNavBarState();
}

class _kCustomBottomNavBarState extends State<kCustomBottomNavBar> {
  int _selectedIndex = 0;
  PageController? _pageController;

  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:150,
      decoration: BoxDecoration(
        color: Color(0xFF163141),
      ),
      child: CustomNavigationBar(
        iconSize: 100,
        selectedColor: Colors.lightGreenAccent,
        strokeColor: Colors.transparent,
        unSelectedColor: Colors.grey,
        backgroundColor: Color(0xFF163141),
        items: [
          CustomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Get.to(() => HomeScreen());
              },
              child: Container(
                height: 50,
                width: 134,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: widget.index == 0
                        ? Color.fromRGBO(255, 255, 255, 0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      StaticAssets.quranRail,
                      height: 25,
                      width: 25,
                    ),
                    widget.index == 0
                        ? SizedBox(
                            width: 10,
                          )
                        : SizedBox.shrink(),
                    widget.index == 0
                        ? Text(
                            "Home",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              ),
            ),
          ),
        //   CustomNavigationBarItem(
        //     icon: InkWell(
        //       onTap: () {
        //         Get.off(() => DuaScreen(), transition: Transition.fadeIn);
        //       },
        //       child: Container(
        //         height: 50,
        //         width: 134,
        //         margin: EdgeInsets.only(top: 20),
        //         decoration: BoxDecoration(
        //             color: widget.index == 1
        //                 ? Color.fromRGBO(255, 255, 255, 0.15)
        //                 : Colors.transparent,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Image.asset(
        //               StaticAssets.kaba,
        //               height: 25,
        //               width: 25,
        //             ),
        //             widget.index == 1
        //                 ? SizedBox(
        //                     width: 10,
        //                   )
        //                 : SizedBox.shrink(),
        //             widget.index == 1
        //                 ? Text(
        //                     "Dua",
        //                     style: TextStyle(color: Colors.white, fontSize: 12),
        //                   )
        //                 : SizedBox.shrink()
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   CustomNavigationBarItem(
        //     icon: InkWell(
        //       onTap: () {
        //         Get.off(() => ProfileScreen(), transition: Transition.fadeIn);
        //       },
        //       child: Container(
        //         height: 50,
        //         width: 134,
        //         margin: EdgeInsets.only(top: 20),
        //         decoration: BoxDecoration(
        //             color: widget.index == 2
        //                 ? Color.fromRGBO(255, 255, 255, 0.15)
        //                 : Colors.transparent,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Icon(
        //               Icons.account_circle,
        //               size: 25,
        //             ),
        //             widget.index == 2
        //                 ? SizedBox(
        //                     width: 10,
        //                   )
        //                 : SizedBox.shrink(),
        //             widget.index == 2
        //                 ? Text(
        //                     "Profile",
        //                     style: TextStyle(color: Colors.white, fontSize: 12),
        //                   )
        //                 : SizedBox.shrink()
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        ],
        currentIndex: widget.index ?? _selectedIndex,
        isFloating: true,
        elevation: 0,
        onTap: (index) {
          _selectedIndex = index;
          _pageController!.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.ease);
        }, /**/
      ),
    );
  }
}
