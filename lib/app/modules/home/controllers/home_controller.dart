import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listit/app/routes/app_pages.dart';

import '../../../data/models/response.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  GetStorage g = GetStorage('MyStorage');
  final count = 0.obs;
  final token="".obs;
  final  exp=DateTime.now().obs;

  @override
  void onInit() {
     Token token = g.read("authentication");
    super.onInit();
  }

  @override
  void onReady() {

    if (g.read("authentication")!=null){

    }else {
      goToAuth();
    }
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void goToAuth() => Get.toNamed(Routes.AUTHENTICATION);
}
