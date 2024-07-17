import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listit/app/data/http/RestClient.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final dio =  Dio(BaseOptions(
    validateStatus: (status){
      return status! < 500;
    }
  ));
  Get.put(RestClient(dio));
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
