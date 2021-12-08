import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Views/story_page_viewer.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:social_media/Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xffF5F5F5),
          elevation: 0,
          toolbarHeight: 9.h,
          title: Text(
            'AppName',
            style: GoogleFonts.k2d(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19.sp),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.facebookMessenger,
                  color: Colors.black,
                ))
          ],
        ),
        body: ListView(
          children: const [
            StoryRow(),
            PostFeed(),
          ],
        )
      ),
    );
  }

  Widget buildCard() => GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 18.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.yellow),
              ),
            ),
          ],
        ),
      );
}
