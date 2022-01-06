import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Model/search/search_user_model.dart';
import 'package:social_media/instance.dart';

class SearchUserController extends GetxController {
  ///Search Text Controller
  TextEditingController searchController = TextEditingController();

  ///Search User Method
  var data = [];
  List<SearchUser> results = [];

  var index;

  @override
  void onInit() {
    super.onInit();
    // getFriendsData();
  }

  var friendsId;

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
      //print(response.body);
      data = jsonDecode(response.body);
      print(data);
      results = data.map((e) => SearchUser.fromJson(e)).toList();

      index = results.indexWhere((element) => element.id == friendsId);

      print("resultss ::${results[index].name}");
      friendsId = results[index].id;
      print("heyyheyyyyy$friendsId");
    } else {
      print("Search api error");
      throw Exception('Failed due to Status code::${response.statusCode}');
    }
    return results;
  }

  ///Get Friends Profile
  void getFriendsData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final response = await http.get(
        Uri.parse(
            "https://abhinavsocialmedia.herokuapp.com/api/v1/user/getProfileDetails/$friendsId"),
        headers: {'Authorization': '${preferences.getString('userToken')}'});
    print(friendsId);
    print("get friends data ${response.statusCode}");
    print("response of friends data ${response.body}");
  }
}
