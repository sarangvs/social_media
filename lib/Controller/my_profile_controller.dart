import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Model/profile/my_profile_model.dart';
import 'package:social_media/Model/profile/user_details_model.dart';
import 'package:dio/dio.dart';

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
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
      var data = (response.data);
      profileModel = MyProfileModel.fromJson(data);
      print(profileModel.user![0].name);
    }
    return profileModel;
  }


}
