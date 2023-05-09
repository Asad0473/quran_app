import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quran_app/utils/static_assets.dart';
import 'package:quran_app/views/home/homeController.dart';
import 'package:quran_app/views/home/widgets/bottomnavbar.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home/homepage.dart';


class ImageDataView extends StatelessWidget {

  Data? data;

  ImageDataView({this.data});
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        key: drawerKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,

          elevation: 0,
          backgroundColor: Color(0xFF163141),
          // leading: InkWell(
          //   onTap: () {
          //     drawerKey.currentState!.openDrawer();
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          //     // child: Icon(
          //     //   Icons.menu,
          //     //   color: Colors.white,
          //     // ),
          //   ),
          // ),
          title: Row(
            children: [
              IconButton(onPressed:(){

                Navigator.pop(context);


              }, icon: Icon(
                Icons.arrow_back,
              )),
              // Text(
              //   "Translation",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold),
              // ),
            ],
          ),
          actions: [
            Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        // drawer: CustomDrawer(),
        bottomNavigationBar: kCustomBottomNavBar(),
        body:


        SafeArea(
          child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {




             return controller.isLoading==true?
              Center(child: CircularProgressIndicator()):
               Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child:

                  controller.data!=null ?
                   controller.data!.surah!=null &&  controller.data!.english!=null &&  controller.data!.urdu!=null  && controller.data!.arabic!=null  ?

                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Surah name:",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text("${controller.data?.surah!}"),

                          Text("Arabic Translation:",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text("${controller.data?.arabic!}"),
                          Text("Urdu Translation:",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text("${controller.data?.urdu!}"),
                          Text("English Translation:",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text("${controller.data?.english!}")
                        ],
                      ),
                    ),
                  ):const Center(child :Text("No Data is Found")) :const Center(child :Text("No Data is Found")),
                );
            },
          ),
        ),
      ),
    );
  }
}

