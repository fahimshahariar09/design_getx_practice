

import 'package:design/controller/api_controller/auth/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  RxBool isLoading = false.obs;


  signinFun()async{
    isLoading.value=true;
    await SignInService.signinService(name: emailController.text, password: passwordController.text);
    isLoading.value=false;
  }

}