import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listit/app/data/http/RestClient.dart';
import 'package:listit/app/data/models/request.dart';
import 'package:listit/app/data/models/response.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController
  var email = ''.obs;
  var password = ''.obs;
  var name =''.obs;
  var errors = <String, String>{}.obs;
  var isLoading=false.obs;
  var isRegisterForm=false.obs;
  // GetStorage g = ;



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
  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }
  void setName(String value) {
    name.value=value;
  }
  void toggleIsRegisterForm(){
    errors.clear();
    isRegisterForm.value=!isRegisterForm.value;
  }
  void register() async{
    isLoading.value=true;
     var response= await Get.find<RestClient>().registerUser(RegisterRequest(name: name.value,email: email.value,password: password.value));
     final apiResponse=parseUserResponse(response.data);
      if (apiResponse.error != null) {
        errors.value = apiResponse.error!.error;
        print("Error: ${apiResponse.error!.error}");
     } else if (apiResponse.data != null) {

       print("User created: ${apiResponse.data!.id}");
     }
      isLoading.value=false;

    }

  ApiResponse<User> parseUserResponse(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return ApiResponse(error: ErrorResponse.fromJson(json));
    } else {
      return ApiResponse(data: UserResponse.fromJson(json).user);
    }

}
  void login() async {
    isLoading.value=true;
    var response= await Get.find<RestClient>().loginUser(LoginRequest(email: email.value,password: password.value));
    print(response.data);
    final apiResponse=parseTokenResponse(response.data);
    if (apiResponse.error != null) {
      errors.value = apiResponse.error!.error;
      if(apiResponse.error!.error["Error"]!=null){
        Get.snackbar("Error", apiResponse.error!.error["Error"]!,backgroundColor: Colors.red);
      }
      print("Error: ${apiResponse.error!.error}");
    } else if (apiResponse.data != null) {
      GetStorage().write("authenticationToken", apiResponse.data!.token);
      GetStorage().write("authenticationExp", apiResponse.data!.expiry);
      print("User created: ${apiResponse.data!.token}");
    }
    isLoading.value=false;

  }
  ApiResponse<Token> parseTokenResponse(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return ApiResponse(error: ErrorResponse.fromJson(json));
    } else {
      return ApiResponse(data: TokenResponse.fromJson(json).token);
    }

  }
}
