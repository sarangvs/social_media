import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Model/post/post_model.dart';
import 'package:social_media/const/api_url.dart';
import 'package:path/path.dart';

class PostController extends GetxController {
  var image;
  var isLoading = false.obs;
  final ImagePicker imagePicker = ImagePicker();

  var postList = <Posts>[];

  // @override
  // void onInit() {
  //  // futurePosts = getAllPost();
  //   getData();
  //   update();
  //   super.onInit();
  // }

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
  Future<void> postImage(var file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //create multipart request for POST or PATCH method
    var user = prefs.get("userData");
    var userEncode = convert.jsonEncode(user);
    var userDecode = convert.jsonDecode(userEncode);
    var userDetails = convert.jsonDecode(userDecode);
    var userId = await userDetails['_id'];
    print(userId);

    var stream = http.ByteStream(file.openRead());
    stream.cast();

    var length = await file.length();

    try {
      var request = http.MultipartRequest("POST", ApiUrl.addPost);

      // add text fields
      request.fields["desc"] = descriptionController.text;
      request.fields["userId"] = userId;
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
    } catch (e) {
      print("ERROR $e");
    }
  }

  ///Api Calling Method
  // Future<List<Posts>> getPost() async {
  //   http.Response response = await http.get(ApiUrl.getPost);
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       List<dynamic> body = convert.jsonDecode(response.body);
  //
  //       List<Posts> posts =
  //           body.map((dynamic item) => Posts.fromJson(item)).toList();
  //       return posts;
  //     } else {
  //       throw "failed";
  //     }
  //   } catch (e) {
  //     print("Fetch Data Error ::$e");
  //     throw "Failed";
  //   }
  // }

// getPostData()async{
//   callApi(ApiUrl.getPost).then((response){
//     Iterable list = convert.json.decode(response.body);
//     postList= list.map((model) => Posts.fromJson(model)).toList();
//   });
// }
}
