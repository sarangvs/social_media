import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Model/profile/my_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:social_media/const/api_url.dart';

class MyProfileController extends GetxController {
  ///user profile details
  MyProfileModel profileModel = MyProfileModel();

  @override
  void onInit() {
    super.onInit();
    getUserData();
    update();
  }

  Future<MyProfileModel> getUserData() async {
    Dio dio = Dio();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    var user = preferences.get("userData");
    var userEncode = jsonEncode(user);
    var userDecode = jsonDecode(userEncode);
    var userDetails = jsonDecode(userDecode);
    var userId = await userDetails['_id'];

    final response = await dio.get(
        "https://abhinavsocialmedia.herokuapp.com/api/v1/user/getProfileDetails/$userId",
        options: Options(headers: {
          'Authorization': '${preferences.getString('userToken')}'
        }));
    // print(response.statusCode);
    // print(response.data);
    if (response.statusCode == 200) {
      var data = (response.data);
      profileModel = MyProfileModel.fromJson(data);

      // print(profileModel.user![0].name);
    }
    return profileModel;
  }

  Future deletePost(String postId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var user = preferences.get("userData");
    var userEncode = jsonEncode(user);
    var userDecode = jsonDecode(userEncode);
    var userDetails = jsonDecode(userDecode);
    var userId = await userDetails['_id'];

    print(postId);

    final body = {"userId": userId, "postId": postId};

    var response = await http.delete(
        Uri.parse(
            "https://abhinavsocialmedia.herokuapp.com/api/v1/user/deletePost"),
        body: body,
        headers: {'Authorization': '${preferences.getString('userToken')}'});
    if (response.statusCode == 200) {
      Get.snackbar("Deleted", "Post has been deleted",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87,
          colorText: Colors.white);
    }
    print(response.statusCode);
    update();
  }
}
