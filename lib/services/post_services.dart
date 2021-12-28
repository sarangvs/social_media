
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class addPostServices{

  static Future<dynamic> uploadFiles(filePath, String desc) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var authToken = preferences.getString("userToken");
    var user = preferences.get("userData");
    var userEncode = jsonEncode(user);
    var userDecode = jsonDecode(userEncode);
    var userDetails = jsonDecode(userDecode);
    var userId = userDetails['_id'];
  }

}