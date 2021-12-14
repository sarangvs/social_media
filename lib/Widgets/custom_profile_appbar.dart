import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Views/settings_screen.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Color(0xffF5F5F5),
    );
  }
}

///My profile appBar

class MyCustomProfileAppBar extends StatelessWidget {
  const MyCustomProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: const Color(0xffF5F5F5),
      actions: [
        IconButton(
            onPressed: () {
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
                  height: 25.h,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Settings'),
                        leading: const FaIcon(FontAwesomeIcons.cog),
                        onTap: () => Get.to(const SettingScreen()),
                        // contentPadding: EdgeInsets.symmetric(vertical: 0.5.sp),
                      ),
                      Divider(
                        indent: 15.w,
                      ),
                      const ListTile(
                        minVerticalPadding: 15,
                        title: Text('Saved'),
                        leading: Icon(Icons.bookmark),
                        // contentPadding: EdgeInsets.symmetric(vertical: 0.5.sp),
                      ),
                      Divider(
                        indent: 15.w,
                      ),
                      const Expanded(
                        child: ListTile(
                          title: Text('Share'),
                          leading: Icon(Icons.share),
                          // contentPadding:
                          //     EdgeInsets.symmetric(vertical: 0.5.sp),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.black,
              size: 12.sp,
            ))
      ],
    );
  }
}
