import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:design/controller/api_controller/apis.dart';

class SignUpService {
  static Future<bool> signupService({required Map<String,dynamic> data}) async {
    try {
      
      Uri url = Uri.parse(Apis.signup);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        //"Authorization": "Bearer $_token",
      };

      var body =jsonEncode(data);

      var response = await http.post(url,headers: headers,body: body);
      if(response.statusCode==201){
        Get.snackbar("message", "SignUp Success");
        return true;
      }else if(response.statusCode==422){
        var responseData =jsonDecode(response.body)['errors'];
        List a =responseData.keys.tiList();
        if(a.contains("email")){
          Get.snackbar('message', "email has been used");
          return false;
        }else if(a.contains("phone")){
          Get.snackbar("message", "phone has been used");
          return false;
        }
      }

      
    } catch (e) {
      log("error :$e");
    }
    return false;
  }
}
