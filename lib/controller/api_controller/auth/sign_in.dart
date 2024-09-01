import 'dart:convert';
import 'dart:developer';

import 'package:design/controller/api_controller/apis.dart';
import 'package:design/controller/local_storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInService {
  static Future<bool> signinService(
      {required String name, required String password}) async {
    try {
      Uri url = Uri.parse(Apis.signin);

      var body = {
        "email_phone": name,
        "password": password,
      };

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        //"Authorization": "Bearer $_token",
      };

      var response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if(response.statusCode==200){
        var responseData = jsonDecode(response.body);
        await LocalStorage().writeData(key: 'token', value: responseData("token"));
        await LocalStorage().writeData(key: 'user info', value: jsonEncode(responseData("response_token")));
        Get.snackbar("message", "Sign In Success");
        return true;
      }else if(response.statusCode ==401){
        Get.snackbar("message", "Sign In failed");
        return false;
      }

    } catch (e) {
      log("error :$e");
    }
    Get.snackbar("message", "Something went wrong");
    return false;
  }
}
