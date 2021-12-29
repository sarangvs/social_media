import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchUserController extends GetxController {
  ///Search Text Controller
  TextEditingController searchController = TextEditingController();

  ///Search User Method

  Future searchUsers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("userToken");
    var user = preferences.get("userData");
    var userEncode = jsonEncode(user);
    var userDecode = jsonDecode(userEncode);
    var userDetails = jsonDecode(userDecode);
    var userId = await userDetails['_id'];
    print(userId);
    print(token);
    var response = await http.get(
        Uri.parse(
            "https://abhinavsocialmedia.herokuapp.com/api/v1/user/search/$userId/${searchController.text}"),
        headers: {'Authorization': '${preferences.getString('userToken')}'});
    print(response.statusCode);

    print("Search User response :: ${response.body}");
  }
}
