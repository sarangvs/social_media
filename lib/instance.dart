import 'package:get/get.dart';
import 'package:social_media/Controller/authentication_controller.dart';
import 'package:social_media/Controller/getx_controller.dart';
import 'package:social_media/Controller/post_controller.dart';

final PageController pageController = Get.put(PageController());

///Authentication controller
final authenticationController = Get.put(AuthenticationController());

///Post Controller
final postController = Get.put(PostController());