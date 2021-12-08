import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Views/story_page_viewer.dart';

///Story Row

class StoryRow extends StatelessWidget {
  const StoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 9.h,
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(const StoryPageViewer()),
                child: DashedCircle(
                  child:const CircleAvatar(
                    radius: 34,
                    backgroundImage: AssetImage('Assets/me.jpg'),
                  ),
                  color: Colors.deepOrangeAccent,
                ),
              );
            },
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 2.w,
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
      padding: const EdgeInsets.only(top: 10),
      height: screenWidth + 250,
      width: screenWidth,
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  color: const Color(0xffF5F5F5),
                  padding: EdgeInsets.all(9.sp),
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    height: 64.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: const Offset(0, 7))
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            child: Row(
                          children: [
                            Container(
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                    image: AssetImage('Assets/me.jpg')),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              'Sarang',
                              style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        )),
                        Positioned(
                            top: 37.sp,
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
                            left: 77.w,
                            child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.bookmark,
                                color: Colors.black54,
                              ),
                            )),
                        Positioned(
                            top: 55.5.h,
                            left: 2.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '1022 likes',
                                  style: GoogleFonts.k2d(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'View all 43 comments',
                                  style: GoogleFonts.k2d(color: Colors.grey),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 4,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 2.h,
              );
            },
          );
        },
      ),
    );
  }
}
