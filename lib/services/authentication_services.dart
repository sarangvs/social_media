import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_media/Controller/exception_controller.dart';
import 'package:social_media/const/api_url.dart';

class AuthenticationServices {

  ///SignUp form Post Request

  static Future<String?> signUp(
      {required String fullName,
      required String userName,
      required String phone,
      required String password}) async {
    final withPhone = {
      "name": fullName,
      "username": userName,
      "phone": phone,
      "password": password,
    };

    var response = await http.post(ApiUrl.signupUrl, body: withPhone);

    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse["status"];

      case 400:
        throw BadRequestException(response.body.toString());
    }
  }

  /// Mobile Otp Verification Post Request

//   static Future<String?> verifyWithOtp(
//       {required String phoneNumber, required String otp}) async {
//     final otpMap = {"phone": phoneNumber, "otp": otp};
//
//     var response = await http.post(ApiUrl.verifyMobileOtp, body: otpMap);
//
//   //  print("Response From Otp With Mobile${response.body}");
//
//     switch (response.statusCode) {
//       case 200:
//         var jsonResponse = jsonDecode(response.body);
//         print(jsonResponse["token"]);
//         print(jsonResponse["user"]);
//       return jsonResponse["token"]["user"];
//
//       case 400:
//         throw InvalidOtp(response.body.toString());
//
//       case 500:
//         throw InvalidInputException(response.body.toString());
//     }
//   }
 }
