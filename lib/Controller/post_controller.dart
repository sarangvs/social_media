import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final ImagePicker _picker = ImagePicker();

 Future<dynamic>pickImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
