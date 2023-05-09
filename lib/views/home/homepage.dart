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

import '../image_data_view_screen.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {


      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          key: drawerKey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF163141),
            leading: InkWell(
              onTap: () {
                drawerKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                // child: Icon(
                //   Icons.menu,
                //   color: Colors.white,
                // ),
              ),
            ),
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
          body: SafeArea(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        StaticAssets.bgPicture,
                                      ))),
                            ),
                            Positioned(
                              top: 220,
                              left: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  showBottomSheet(context,controller);
                                },
                                child: Container(
                                  height: 150,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: controller.selectedimagepath.value == ""
                                      ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.camera_alt_rounded,
                                          size: 50,
                                          color: Color(0xFF163141),
                                        ),
                                      ),
                                      Text("Tap to scan ayat pic")
                                    ],
                                  )
                                      : Image.file(
                                      File(controller.selectedimagepath.value)
                                  ),
                                ),
                              ),
                            )


                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        // Spacer(),




                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

  }

  void showBottomSheet(BuildContext context,HomeController controller) async {
    showModalBottomSheet<void>(
      backgroundColor: Colors.grey.shade200,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Take a Photo"),
              onTap: () async {
                Get.back();
                controller.isLoading=true;
                controller.update();

                controller.data = Data();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageDataView()),
                );



                Uint8List? image = await callGetImagefromCamera();


                // ImagePicker _picker = ImagePicker();
                // XFile? image = await _picker.pickImage(
                //   source: ImageSource.gallery,
                // );

                if (image != null) {
                  // Send image to server

                  print("sddfsdfsdqweqwe");
                  controller.data = await controller.sendImageToServer(image);

                  print("data ${controller.data?.arabic!}");

                  ///  Display response on the screen





                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext con) {
                  //     return AlertDialog(
                  //       title: Text("Server Response"),
                  //       content: Text(data!.arabic!),
                  //       actions: [
                  //         TextButton(
                  //           child: Text("OK"),
                  //           onPressed: () {
                  //             Navigator.pop(con);
                  //           },
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                  // Get.back();

                }
                else{
                   Get.back();


                }
              }



              // async {
              //
              //
              //   // Navigator.pop(context);
              //   // ImagePicker _picker = ImagePicker();
              //   // XFile? image = await _picker.pickImage(
              //   //   source: ImageSource.camera,
              //   // );
              //   // if (image != null) {
              //   //   // Send image to server
              //   //   String response = await sendImageToServer(image.path);
              //   //   // Display response on the screen
              //   //   showDialog(
              //   //     context: context,
              //   //     builder: (BuildContext context) {
              //   //       return AlertDialog(
              //   //         title: Text("Server Response"),
              //   //         content: Text(response),
              //   //         actions: [
              //   //           TextButton(
              //   //             child: Text("OK"),
              //   //             onPressed: () {
              //   //               Navigator.pop(context);
              //   //             },
              //   //           ),
              //   //         ],
              //   //       );
              //   //     },
              //   //   );
              //   // }
              // },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Choose from Gallery"),
              onTap: () async {
                Get.back();




                controller.isLoading=true;
                controller.update();
                controller.data = Data();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageDataView()),
                );

                Uint8List? image = await callGetImage();



                // ImagePicker _picker = ImagePicker();
                // XFile? image = await _picker.pickImage(
                //   source: ImageSource.gallery,
                // );

                if (image != null) {

                  print("asdaasdasdasd");
                  // Send image to server
                  controller.data = await controller.sendImageToServer(image);

                  print("data ${controller.data?.arabic!}");

                  ///  Display response on the screen





                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext con) {
                    //     return AlertDialog(
                    //       title: Text("Server Response"),
                    //       content: Text(data!.arabic!),
                    //       actions: [
                    //         TextButton(
                    //           child: Text("OK"),
                    //           onPressed: () {
                    //             Navigator.pop(con);
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                    // Get.back();

                  }
                else{

                  Get.back();
                }

                }



            //  },
            ),
          ],
        );
      },
    );
  }

  static Future<dynamic> httpMultiPartPostRequest(
      http.MultipartRequest request) async {
    http.Response response;

    final streamedResponse = await request.send();
    response = await http.Response.fromStream(streamedResponse);

    return _returnResponse(response);
  }
}
// Future<void> uploadProfilePictureApi(
//       String email, File imageFile) async {
//
//       var stream = http.ByteStream(imageFile.openRead());
//       stream.cast();
//       var request = http.MultipartRequest(
//           "POST", Uri.parse('http://192.168.100.5:5000/Evaluate'));
//       request.fields['img'] = email;
//       var contentType;
//
//       if (imageFile.path.endsWith('.png')) {
//         contentType = MediaType('image', 'png');
//       } else if (imageFile.path.endsWith('.jpg') ||
//           imageFile.path.endsWith('.jpeg')) {
//         contentType = MediaType('image', 'jpeg');
//       }
//       request.files.add(
//         await http.MultipartFile.fromPath('file', imageFile.path,
//             contentType: contentType, filename: imageFile.path.split("/").last),
//       );
//
//       var response = await httpMultiPartPostRequest(request);
//
//
//
//     }

Future<dynamic> httpMultiPartPostRequest(http.MultipartRequest request) async {
  http.Response response;

  final streamedResponse = await request.send();
  response = await http.Response.fromStream(streamedResponse);

  return _returnResponse(response);
}


//
// Future<bool> createData( {
//   String Bio,
//   String userName,
//   Uint8List coverImageBytes,
//   Uint8List profileImageBytes,
//   String dob,
//   String firstName,
//   String lastName,
//   String gender,
// })
// async {
//
//
//
//
//
//
//
//   isUpdateProfile = true;
//   print(" isUpdateProfile ${ isUpdateProfile}");
//   print("asdads ${gender}");
//   update();
//
//
//   Map<String, String> headers = {
//     "Token": storage.read('token'),
//     "Authorization": 'Bearer e06b4395-4411-4c2c-9585-952900e5ba25',
//     'X-Requested-With': 'XMLHttpRequest',
//     "Access-Control-Allow-Origin": "*",
//   };
//   final request = await http.MultipartRequest("Post" , Uri.parse(Url.updateProfileUrl));
//   request.headers.addAll(headers);
//
//
//
//
//
//   if(gender!=null) {
//     request.fields['gender'] = gender;
//   }
//
//   if(firstName!=null) {
//     request.fields['firstname'] = firstName;
//   }
//
//   if(lastName!=null) {
//     request.fields['lastname'] = lastName;
//
//   }
//
//   print("lastName ${lastName}");
//
//
//
//
//
//   if(Bio!=null){
//     request.fields['about_me'] = Bio;
//   }
//   if (dob!=null){
//     request.fields["dob"]=dob;
//   }
//   if( coverImageBytes!=null){
//     request.files.add(http.MultipartFile.fromBytes(
//       'cover_image', coverImageBytes,
//       filename: "Name",
//     ));
//   }
//   if( profileImageBytes!=null){
//     request.files.add(http.MultipartFile.fromBytes(
//       'profile_image',
//       profileImageBytes,
//       filename: "Name",
//     ));
//   }
//
//
//   var response = await request.send();
//   response.stream.bytesToString().asStream().listen((event) {
//
//     var parsedJson = json.decode(event);
//     print("event");
//     print(event);
//     print("event");
//
//     if (parsedJson['errors'] != null) {
//       print('error show ${parsedJson.toString()}') ;
//       if (parsedJson['errors']['username'] != null) {
//         //  if (parsedJson['errors']['username'].length > 0) {
//         print('error show in case of error ${parsedJson.toString()}') ;
//         //    isUserNameTaken = true;
//
//         update();
//
//         return '0';
//
//         // }
//       }
//       return "0";
//     } else {
//       print('vvvvvvvvvvvvvvvvvvvvvvvvv');
//       //   isUserNameTaken = false;
//       update();
//       return parsedJson['meta']['code'].toString();
//     }
//   });
//
//
//
//   userProfile = await newsFeedControler.getUserProfile();
//   storage.write("user_profile", jsonEncode(userProfile));
//   storage.write("username", userProfile.username);
//   storage.write("dob", userProfile.dob);
//   String userData = storage.read("user_profile");
//
//   Get.find<NewsfeedController>().userProfile = UserProfile.fromJson(jsonDecode(userData));
//
//   Get.find<NewsfeedController>().userProfile.username = storage.read("user_name");
//   Get.find<NewsfeedController>().update();
//   update();
//   return isUserNameTaken;
//
//
// }


Future<PickedFile?> getImage() async {
  try {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile;
    }
    else {
      // print(pickedFile.path);
      return null;
    }
  } catch (e) {
    print("errrrrrrrrrrrrrrrrrrrr$e");
  }
}





Future<PickedFile?> getImageFromCamera() async {
  try {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return pickedFile;
    }
    else {
      // print(pickedFile.path);
      return null;
    }
  } catch (e) {
    print("errrrrrrrrrrrrrrrrrrrr$e");
  }
}





Future<Uint8List?> callGetImagefromCamera() async {
  print("kkkk");
  Uint8List image;
  var img = await getImageFromCamera();


  if(img!=null)
    {

      image = await img!.readAsBytes();
    }
  else{


    return null;
  }


  // pickedMedia = await dataController.getImageWeb();
  // _pickedImage.add(imageBytes);
  // print("img ${image}");
  print('NAHI ATA IDHAR');


  // if (_pickedImage != null) {
  //   print('I D H A R A J A T A H A I');
  //   isMediaAttached = true;
  //
  //   setState(() {});
  // }
  return image;
}


Future<Uint8List?> callGetImage() async {
  print("kkkk");
  Uint8List image;
  var img = await getImage();

    if(img !=null)
      {
        image = await img!.readAsBytes();
      }
    else{

      return null;
    }


  // pickedMedia = await dataController.getImageWeb();
  // _pickedImage.add(imageBytes);
  // print("img ${image}");
  print('NAHI ATA IDHAR');


  // if (_pickedImage != null) {
  //   print('I D H A R A J A T A H A I');
  //   isMediaAttached = true;
  //
  //   setState(() {});
  // }
  return image;
}




// }
dynamic _returnResponse(http.Response response) {
  // ignore: prefer_typing_uninitialized_variables
  var jsonResponse;
  try {
    jsonResponse = jsonDecode(response.body);
  } on FormatException catch (_) {
    jsonResponse = response.body;
  }
  switch (response.statusCode) {
    case 200:
      return jsonResponse;
    case 201:
      return jsonResponse;
    case 400:
      break;
  // throw BadRequestException(jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 401:
      break;
  // throw InvalidInputException(jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 403:
      break;
  // throw UnauthorisedException(jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 404:
      break;
  // throw FetchDataException(jsonResponse['message'] ?? AppConstant.exceptionMessage);
    case 500:
    default:
    // throw FetchDataException(jsonResponse['message'] ?? AppConstant.exceptionMessage);
  }
}

Future<void> requestCameraAndGalleryPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
  ].request();

  PermissionStatus cameraStatus = statuses[Permission.camera]!;
  PermissionStatus storageStatus = statuses[Permission.storage]!;

  if (cameraStatus.isDenied || storageStatus.isDenied) {
    // Permission denied by user
    // You can show a dialog or a snackbar to inform the user
    print("Camera or Storage permission denied by user.");
  } else if (cameraStatus.isGranted && storageStatus.isGranted) {
    // Permission granted by user
    // You can proceed with accessing the camera and gallery
    print("Camera and Storage permission granted by user.");
  }
}


class Data {
  String? arabic;
  String? english;
  String? surah;
  String? urdu;

  Data({this.arabic, this.english, this.surah, this.urdu});

  Data.fromJson(Map<String, dynamic> json) {
    arabic = json['Arabic'];
    english = json['English'];
    surah = json['Surah'];
    urdu = json['Urdu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Arabic'] = this.arabic;
    data['English'] = this.english;
    data['Surah'] = this.surah;
    data['Urdu'] = this.urdu;
    return data;
  }
}
