import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listit/app/modules/home/controllers/home_controller.dart';
import 'package:listit/app/routes/app_pages.dart';

class TestController extends GetxController {
  //TODO: Implement TestController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void logOut() {
    GetStorage().remove("authenticationToken");
    GetStorage().remove("authenticationExp");
    Get.offAndToNamed(Routes.HOME);
  }
}
