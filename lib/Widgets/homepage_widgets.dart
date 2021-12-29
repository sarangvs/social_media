import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Model/post_model.dart';
import 'package:social_media/Views/story_page_viewer.dart';
import 'package:social_media/instance.dart';

///Story Row

class StoryRow extends StatelessWidget {
  const StoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 0.9, left: 3.w),
      width: screenWidth,
      height: 11.h,
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(const StoryPageViewer()),
                child: Padding(
                  padding: EdgeInsets.all(1.w),
                  child: DashedCircle(
                    color: Colors.orangeAccent,
                    dashes: 10,
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 8.6.w,
                        backgroundImage: const AssetImage('Assets/me.jpg'),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 4.w,
              );
            },
          );
        },
      ),
    );
  }
}

///Post feeds

class PostFeed extends StatelessWidget {
  const PostFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        height: screenWidth + 250,
        width: screenWidth,
        child: FutureBuilder(
          future: postController.getPost(),
            builder: (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(3.5.w),
                padding: EdgeInsets.only(
                    left: 1.4.w, top: 2.h, right: 2.5.w, bottom: 0),
                height: 68.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                        child: Row(
                      children: [
                        CircleAvatar(
                          radius: 5.w,
                          backgroundImage: const AssetImage('Assets/me.jpg'),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          ("Sarang"),
                          style: GoogleFonts.k2d(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    )),
                    Positioned(
                        top: 37.sp,
                        left: 1.3.w,
                        child: Container(
                          height: 44.h,
                          width: 87.w,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('Assets/post.jpg'),
                                  fit: BoxFit.fitWidth),
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    Positioned(
                        top: 50.h,
                        left: 0.w,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                splashColor: Colors.grey,
                                icon: Image.asset(
                                  'Assets/heart.png',
                                  fit: BoxFit.contain,
                                )),
                            IconButton(
                                onPressed: () {},
                                splashColor: Colors.grey,
                                icon: Image.asset(
                                  'Assets/comment.png',
                                  fit: BoxFit.contain,
                                )),
                          ],
                        )),
                    Positioned(
                        top: 50.h,
                        left: 78.5.w,
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.bookmark,
                            color: Colors.black54,
                          ),
                        )),
                    Positioned(
                        top: 56.h,
                        left: 2.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 0.7.h,
                            ),
                            Text(
                              '1022 likes',
                              style:
                                  GoogleFonts.k2d(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 0.7.h,
                            ),
                            Text(
                                ('view all 44 comments'),
                              style: GoogleFonts.k2d(color: Colors.grey),
                            )
                          ],
                        ))
                  ],
                ),
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox();
            },
          );
        }));
  }
}
