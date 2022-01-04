import 'package:get/get.dart';
import 'package:social_media/Controller/authentication_controller.dart';
import 'package:social_media/Controller/getx_controller.dart';
import 'package:social_media/Controller/my_profile_controller.dart';
import 'package:social_media/Controller/post_controller.dart';
import 'package:social_media/Controller/search_user_controller.dart';

final PageController pageController = Get.put(PageController());

///Authentication controller
final authenticationController = Get.put(AuthenticationController());

///Post Controller
final postController = Get.put(PostController());

///Search user Controller
final SearchUserController searchUserController = Get.put(SearchUserController());

///my profile
final MyProfileController myProfileController = Get.put(MyProfileController());


