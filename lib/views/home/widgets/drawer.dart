import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_text.dart';
import 'package:quran_app/utils/static_assets.dart';
import 'package:quran_app/views/Profile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Color(0xFF163141),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(context),
                  buildMenuItems(context),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => InkWell(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                customHeader(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                kDrawerTile(
                  image: Icons.account_circle,
                  text: "Profile",
                  context: context,
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                kDrawerTile(
                    image: Icons.logout, text: "Logout", context: context),
              ],
            ),
          ),
        ),
      );
}

customHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(StaticAssets.kaba), fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quran Pak",
              style: AppText.h2b,
            ),
          ],
        )
      ],
    ),
  );
}

kDrawerTile({final image, final text, final context, final onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.only(
          left: 30,
          right: 10,
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                image,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: AppText.h2b,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    ),
  );
}
