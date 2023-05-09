import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'homepage.dart';

class HomeController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  var selectedimagepath = ''.obs;
  File? imageFile;
  XFile? pickedFile;
  Data? data;
  bool isLoading = false;
  Future getImage(ImageSource imageSource) async {
    final pickedFile = await imagePicker.getImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      selectedimagepath.value = pickedFile.path;
      update();
    } else {
      print("<=======No Image Selected======>");
    }
  }



  Future<Data?> sendImageToServer(Uint8List image) async {


    isLoading = true;
    update();


    Map<String, String> headers = {

      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
    };


    var request = http.MultipartRequest("Post", Uri.parse("http://mbilal.store:5000/Evaluate"), // Replace with your server URL
    );

    request.headers.addAll(headers);


    print("img ${image}");

    request.files.add(
        http.MultipartFile.fromBytes(
          "img", image,
          filename: "Name",
        ));



    try{

      var response = await request.send();



      var responseBody = await response.stream.bytesToString();

      Map<String, dynamic> parsedJson = json.decode(responseBody);

      print("responseBody ${responseBody}");
      if(responseBody.isEmpty )
        {

          print("sdasdasdasdasd");
          Get.snackbar("", "No data is Found");
          Get.back();
          return null;


        }



      Data? data;
      data = Data.fromJson(parsedJson);

      isLoading = false;
      update();

      // if(data.isNull || data.isNullOrBlank!)
      //   // {
      //   //   isLoading = false;
      //   //   update();
      //   //   return null;
      //   //
      //   //
      //   // }




      return data;

    }
    catch(e)
    {

      isLoading = false;
      update();
      print("idhr ");


      return null;
    }


    // json.decode(utf8.decode(response.));
    //print('responseBody ${responseBody}');


    // await response.stream.bytesToString().asStream().listen((event) {
    //
    //
    //
    //   print("event");
    //
    //
    //
    //
    //   // print(event);
    //   // print("event");
    //   //
    //   // // if (parsedJson['errors'] != null) {
    //   // //   print('error show ${parsedJson.toString()}') ;
    //   // //   if (parsedJson['errors']['username'] != null) {
    //   // //     //  if (parsedJson['errors']['username'].length > 0) {
    //   // //     print('error show in case of error ${parsedJson.toString()}') ;
    //   // //     //    isUserNameTaken = true;
    //   // //
    //   // //
    //   // //
    //   // //     // }
    //   // //   }
    //   // //
    //   // // } else {
    //   //
    //   //  // print(parsedJson['Arabic'].toString());
    //   //
    //   //
    //   //  // print('vvvvvvvvvvvvvvvvvvvvvvvvv');
    //   //   //   isUserNameTaken = false;
    //
    //  //}
    // });


    //print("responseBody ${responseBody}");


    // if (response.statusCode == 200) {
    //   // Successful response from server
    //   return responseBody;
    // } else {
    //   // Error response from server
    //   return "Error: ${response.statusCode}";
    // }
  }


  @override
  void dispose() {
    super.dispose();
  }
}
