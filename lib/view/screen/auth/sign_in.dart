import 'package:design/controller/ui_controller/auth/sign_in.dart';
import 'package:design/view/common_widget/common_button.dart';
import 'package:design/view/screen/auth/widget/email_text_field.dart';
import 'package:design/view/screen/auth/widget/pass_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: signInController.formKey,
            child: Column(
              children: [
                buildSizedBox(height: 200),
                EmailTextField(
                  emailController: signInController.emailController,
                ),
                buildSizedBox(height: 10),
                PassTextField(
                  passwordController: signInController.passwordController,
                ),
                buildSizedBox(height: 20),
                CommonButton(
                    buttonName: "Sign In",
                    onTab: () {
                      if (signInController.formKey.currentState!.validate()) {
                        return ;
                      }
                      signInController.signinFun();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) => SizedBox(
        height: height,
        width: width,
      );
}
