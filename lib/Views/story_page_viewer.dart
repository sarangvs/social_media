import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/instance.dart';
import 'package:story_view/story_view.dart';

class StoryPageViewer extends StatelessWidget {
  const StoryPageViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: StoryView(
        storyItems: [
          StoryItem.text(
              title: 'Story view Testing', backgroundColor: Colors.yellow),
          StoryItem.pageImage(
              url:
                  'https://fsa.zobj.net/crop.php?r=IRZKYZuStcqATAMDE0kIK0c2mOGqBb-uYdoPMMeMc6r8auVF8vqbaRMjJUl7MAMfc2KWbeLj989iK4GHfA2fleU0KtuvkdB7S-TPjKRqUSNpgISp5XejB-E38F7FaJM8DMOyT2GNf62_ord2UdtAQK5J5opRtuYA-BIfGy8R-UkX0Za0WuEUHQe2nnHOzgj5x4-imL1_rbAMBLga',
              controller: pageController.storyController)
        ],
        controller: pageController.storyController,
        onComplete: () {
          Get.back();
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Get.back();
          }
        },
      ),
    ));
  }
}
