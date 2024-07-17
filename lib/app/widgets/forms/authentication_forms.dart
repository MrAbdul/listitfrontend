

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listit/app/modules/authentication/controllers/authentication_controller.dart';

class RegisterationForm extends GetView<AuthenticationController> {
   RegisterationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      child: Obx(() {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'name',
                errorText: controller.errors['name'],
              ),

              onChanged: (value) => controller.setName(value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email',
                errorText: controller.errors['email'],
              ),
              onChanged: (value) => controller.setEmail(value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password',
                errorText: controller.errors['password'],
              ),
              obscureText: true,
              onChanged: (value) => controller.setPassword(value),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                switch (controller.isLoading.value){
                  true =>  ElevatedButton(
                    onPressed: (){},
                    child: CircularProgressIndicator(),
                  ),
                  false =>  ElevatedButton(
                    onPressed: controller.register,
                    child: Text('Register'),
                  ),
                },
                ElevatedButton(onPressed: controller.toggleIsRegisterForm, child: const Text("Login"))
              ],
            )


          ],
        );
      }),
    );
  }
}

class LoginForm extends GetView<AuthenticationController> {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      child: Obx(() {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email',
                errorText: controller.errors['email'],
              ),
              onChanged: (value) => controller.setEmail(value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password',
                errorText: controller.errors['password'],
              ),
              obscureText: true,
              onChanged: (value) => controller.setPassword(value),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                switch (controller.isLoading.value){

                  true =>  ElevatedButton(
                    onPressed: (){},
                    child: CircularProgressIndicator(),
                  ),
                  false =>  ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Login'),
                  ),
                },
                ElevatedButton(onPressed: controller.toggleIsRegisterForm, child: const Text("Register"))

              ],
            )

          ],
        );
      }),
    );
  }
}

