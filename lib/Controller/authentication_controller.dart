import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media/const/api_url.dart';
import 'package:social_media/services/authentication_services.dart';
import 'exception_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  ///SignUP Form Key
  static final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///Login Form Key
  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  ///SignUP Function
  Future<String?> signUp() async {
    final isValid = signUpFormKey.currentState!.validate();

    if (!isValid) {
      return null;
    } else {
      String userFullName = fullNameController.text;
      String userUserName = userNameController.text;
      String userPhone = phoneController.text;
      String userPassword = passwordController.text;

      try {
        final result = await AuthenticationServices.signUp(
            fullName: userFullName,
            userName: userUserName,
            phone: userPhone,
            password: userPassword);
        return result;
      } on SocketException {
        Get.snackbar('Something went wrong', 'Check your internet connection',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black87,
            colorText: Colors.white,
            icon: const Icon(
              CupertinoIcons.wifi_slash,
              color: Colors.white,
            ));
      } on HttpException {
        Get.snackbar(
          'Network Error',
          'Please try after sometime',
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } on TimeoutException {
        Get.snackbar(
          'Connection Timeout',
          'Please try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white,
        );
      } on BadRequestException {
        Get.snackbar(
          'Phone Number Already Exist',
          'Try a different phone number',
          icon: const Icon(
            CupertinoIcons.device_phone_portrait,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white,
        );
      }
    }
    return null;
  }

  ///Signup Text Editing Controllers

  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///Login Text Editing Controller

  TextEditingController loginUserDetailController = TextEditingController();
  TextEditingController loginUserPassword = TextEditingController();

  ///Validate Login Fields
  String? validateUserDetail(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.length <= 3) {
      return "Provide a valid Name";
    } else {
      return null;
    }
  }

  String? validateLoginPassword(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.length <= 3) {
      return "Oops Your Password Needs 8 Characters";
    } else {
      return null;
    }
  }

  ///SignUp Form Validation

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.length <= 3) {
      return "Provide a valid Name";
    } else if (value.isAlphabetOnly) {
      return null;
    } else {
      return "Provide valid information";
    }
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.length <= 3) {
      return "Oops! User Name needs 6+ characters";
    }
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.isNumericOnly) {
      return null;
    } else if (value.length < 10) {
      return "Enter a Valid Phone Number";
    } else if (value.length > 10) {
      return "Enter a Valid Phone Number";
    } else if (value.length == 10) {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "This Field is Required";
    } else if (value.length < 8) {
      return "Oops Your Password Needs 8 Characters";
    } else {
      return null;
    }
  }

  ///Verify Mobile Otp
  // Future<String?> otpVerification(String otp) async {
  //   String phoneNumber = phoneController.text;
  //
  //   try {
  //     final result = await AuthenticationServices.verifyWithOtp(
  //         phoneNumber: phoneNumber, otp: otp);
  //     print("Result from otppppp $result");
  //     return result;
  //   } on SocketException {
  //     Get.snackbar('Something went wrong', 'Check your internet connection',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.black87,
  //         colorText: Colors.white,
  //         icon: const Icon(
  //           CupertinoIcons.wifi_slash,
  //           color: Colors.white,
  //         ));
  //   } on HttpException {
  //     Get.snackbar(
  //       'Network Error',
  //       'Please try after sometime',
  //       backgroundColor: Colors.black87,
  //       colorText: Colors.white,
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } on TimeoutException {
  //     Get.snackbar(
  //       'Connection Timeout',
  //       'Please try again',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.black87,
  //       colorText: Colors.white,
  //     );
  //   } on InvalidOtp {
  //     Get.snackbar(
  //       'Invalid otp or otp expired',
  //       'Please try again',
  //       icon: const Icon(
  //         CupertinoIcons.device_phone_portrait,
  //         color: Colors.white,
  //       ),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.black87,
  //       colorText: Colors.white,
  //     );
  //   }
  //   return null;
  // }
  ///MOBILE OTP
  Future<String?> mobileOtpVerify(String otp) async {
    final body = {"phone": phoneController.text, "otp": otp};

    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      var response = await http.post(ApiUrl.verifyMobileOtp, body: body);

      switch (response.statusCode) {
        case 200:
          var jsonResponse = jsonDecode(response.body);
          // print(jsonResponse["user"]);
          //  print(jsonResponse["token"]);
          preferences.setString('user', jsonResponse["user"]);
          preferences.setString('token', jsonResponse["token"]);

          dynamic userToken = preferences.getString('token');
          dynamic userDetails = preferences.getString('user');
         // print(userToken);
          // print(userDetails);

          return jsonResponse["user"]["token"];

        case 400:
          throw InvalidOtp(response.body.toString());

        case 500:
          throw InvalidInputException(response.body.toString());
      }
    } on SocketException {
      Get.snackbar('Something went wrong', 'Check your internet connection',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white,
          icon: const Icon(
            CupertinoIcons.wifi_slash,
            color: Colors.white,
          ));
    }
  }

  ///login
  Future<String?> userLogin() async {
    final isValid = loginFormKey.currentState!.validate();

    if (!isValid) {
      return null;
    } else {

    final body = {
      "phone": loginUserDetailController.text,
      "password": loginUserPassword.text
    };

    var response = await http.post(ApiUrl.loginUrl, body: body);

    if (response.statusCode == 200) {
      var jsonRes = jsonDecode(response.body);
      print(jsonRes);
    }
  }
  }
}
