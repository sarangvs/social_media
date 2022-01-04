import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Model/search/search_user_model.dart';

class SearchUserController extends GetxController {
  ///Search Text Controller
  TextEditingController searchController = TextEditingController();

  ///Search User Method
  var data = [];
  List<SearchUser> results = [];


  Future<List<SearchUser>> searchUsers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var user = preferences.get("userData");
    var userEncode = jsonEncode(user);
    var userDecode = jsonDecode(userEncode);
    var userDetails = jsonDecode(userDecode);
    var userId = await userDetails['_id'];
    // print(userId);
    // print(token);
    var response = await http.get(
        Uri.parse(
            "https://abhinavsocialmedia.herokuapp.com/api/v1/user/search/$userId/${searchController.text}"),
        headers: {'Authorization': '${preferences.getString('userToken')}'});
   // print(response.statusCode);
    if (response.statusCode == 200) {
     // print(response.body);
      data = jsonDecode(response.body);
      results = data.map((e) => SearchUser.fromJson(e)).toList();
      print("results from function  $results");
    } else {
      print("Search api error");
      throw Exception('Failed due to Status code::${response.statusCode}');
    }
    return results;
  }
}
