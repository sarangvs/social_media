import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Model/post_model.dart';
import 'package:social_media/const/api_url.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';

class PostController extends GetxController {
  var image;
  var isLoading = false.obs;
  final ImagePicker imagePicker = ImagePicker();



  ///Description Controller
  TextEditingController descriptionController = TextEditingController();

  ///Get Image from device and show on add post screen
  Future<dynamic> getImage() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = pickedImage;
      update();
    } else {
      print("no image selected");
    }
  }

  ///UPLOAD POST TO DB
  Future<void> uploadImage(var file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //create multipart request for POST or PATCH method
    var user = prefs.get("userData");
    var userEncode = jsonEncode(user);
    var userDecode = jsonDecode(userEncode);
    var userDetails = jsonDecode(userDecode);
    var userId = await userDetails['_id'];

    var stream = http.ByteStream(file.openRead());
    stream.cast();

    var length = await file.length();

    try {
      var request = http.MultipartRequest("POST", ApiUrl.addPost);

      // add text fields
      request.fields["desc"] = descriptionController.text;
      request.fields["userid"] = userId;
      Map<String, String> requestHeaders = {
        'Authorization': '${prefs.getString('userToken')}',
      };
      request.headers.addAll(requestHeaders);

      var multipartFile = http.MultipartFile("files", stream, length,
          filename: basename(file.path));
      request.files.add(multipartFile);

      print("request: " + request.toString());
      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("UPLOADED");
      }
    }catch(e){
      print("ERROR $e");
    }
  }

  ///FETCH POST FROM DB
  Future<AllPost?>getAllPost()async{
    final response = await http.get(ApiUrl.getPost);
    print(response.statusCode);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      return AllPost.fromJson(jsonData);
    }else{
      throw Exception("Failed to load data");
    }
  }



}
