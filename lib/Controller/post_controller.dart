import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController {
  File? image;
  bool showSpinner = false;
  final ImagePicker imagePicker = ImagePicker();


  @override
  void onInit() {
  super.onInit();
  }

  ///Description Controller
  TextEditingController descriptionController = TextEditingController();


///Get Image from device and show on add post screen
 Future<dynamic>getImage() async {

    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      image = File(pickedImage.path);
      update();
    }else{
      print("no image selected");
    }
  }

///Add post to DB
  Future<void> addPost()async{
   showSpinner = true;
   update();

   SharedPreferences prefs = await SharedPreferences.getInstance();
   var user = prefs.getString("userData");



   final body ={
     "Desc":descriptionController.text,
     "userId":"",
     "files":image
   };

  }


}
