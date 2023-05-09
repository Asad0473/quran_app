import 'package:get/get.dart';
import 'package:quran_app/controllers/getStorageController.dart';
import 'package:quran_app/controllers/onboarding_Controller.dart';
import 'package:quran_app/views/home/homeController.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OnBoardingController(), fenix: true);
    Get.lazyPut(() => GetSTorageController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
