import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:listit/app/widgets/forms/authentication_forms.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return switch (controller.isRegisterForm.value){
            true =>  RegisterationForm(),
            false => LoginForm(),
          };
        })
      ),
    );
  }
}
