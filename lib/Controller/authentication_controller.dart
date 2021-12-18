import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media/services/authentication_services.dart';
import 'exception_controller.dart';



class AuthenticationController extends GetxController {
  ///SignUP Form Key
  static final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

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
  Future<String?>? otpVerification(String otp) {
    String phoneNumber = phoneController.text;

    try {
      final result = AuthenticationServices.verifyWithOtp(
          phoneNumber: phoneNumber, otp: otp);
      print("Result from otp $result");
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
        'Invalid otp or otp expired',
        'Please try again',
        icon: const Icon(
          CupertinoIcons.device_phone_portrait,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
      );
    }
    return null;
  }
}
