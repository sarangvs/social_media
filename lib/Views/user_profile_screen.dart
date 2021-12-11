import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Widgets/custom_profile_appbar.dart';
import 'package:social_media/Widgets/homepage_widgets.dart';
import 'package:social_media/Widgets/profile_header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const CustomProfileAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                      color: const Color(0xffF5F5F7),
                      child: const ProfileHeader()),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Container(
                  color: const Color(0xffF5F5F7),
                  padding: EdgeInsets.symmetric(horizontal: 13.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            'Lives in Calicut, Kerala',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          const Text('Developer||Cars||Dogs'),
                        ],
                      )
                    ],
                  ),
                ),
                FutureBuilder(
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            color: const Color(0xffF5F5F5),
                            padding: EdgeInsets.all(8.sp),
                            child: Container(
                              padding: EdgeInsets.all(7.sp),
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
                                      blurRadius: 3,
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
                                              borderRadius: BorderRadius.circular(100.sp),
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
                                      left: 77.w,
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
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '1022 likes',
                                            style: GoogleFonts.k2d(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h,),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
