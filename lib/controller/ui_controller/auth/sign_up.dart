import 'package:design/controller/api_controller/auth/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController passController =TextEditingController();
  TextEditingController conpassController =TextEditingController();

  RxBool isLoading =false.obs;


  signupFun()async {
    Map<String, dynamic> data = {
      "email": emailController.text,
      "phone": phoneController.text,
      'password': passController.text,
      "password_confirmation": conpassController.text
    };

    await SignUpService.signupService(data: data);

  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    passController.dispose();
    conpassController.dispose();
    super.dispose();
  }
}