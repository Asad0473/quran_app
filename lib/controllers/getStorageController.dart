import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetSTorageController extends GetxController implements GetxService {
  final box = GetStorage();

  Future<void> initstorage() async {
    await GetStorage().initStorage;
  }

  Future<void> removeStorage() async {
    log("<--------------Get Storage Remove Before-------------->");
    log(box.getKeys().toString());
    log(box.getValues().toString());
    await box.erase().then((value) async {
      print("removeee storage");
      update();
    });
    log("<--------------Get Storage Remove After-------------->");
    log(box.getKeys().toString());
    log(box.getValues().toString());
  }
}
