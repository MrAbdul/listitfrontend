import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listit/app/routes/app_pages.dart';

import '../../../data/models/response.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final count = 0.obs;
  final token="".obs;
  final  exp=DateTime.now().obs;
  @override
  void onInit() {
    token.value = GetStorage().read("authenticationToken")??"";
    exp.value=DateTime.parse(GetStorage().read("authenticationExp")??DateTime.timestamp().toString());
    super.onInit();
  }

  @override
  void onReady() {

    if (token.value !=""&&exp.value.compareTo(DateTime.now())>0){
      print("is authenticated");
      print(token.value);
      print(exp.value);
      goToTest();
    }else {
      print("auth:");
      print(token.value);
      print(exp.value);
      print("not authenticated");
      goToAuth();
    }
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void goToAuth() => Get.offAndToNamed(Routes.AUTHENTICATION);
  void goToTest()=> Get.offAndToNamed(Routes.TEST);
}
