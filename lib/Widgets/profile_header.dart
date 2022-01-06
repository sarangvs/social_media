import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Controller/my_profile_controller.dart';
import 'package:social_media/Model/profile/my_profile_model.dart';
import 'package:social_media/Views/edit_my_profile.dart';
import 'package:social_media/Views/following_followers_screen.dart';

import '../instance.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 65.h,
          width: 100.w,
          color: const Color(0xffF5F5F7),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.sp),
                child: Container(
                  width: 91.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('Assets/banner.jpg'),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                  left: 34.w,
                  top: 16.5.h,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50.sp,
                    backgroundImage: const AssetImage('Assets/me.jpg'),
                  )),
              Positioned(
                  top: 33.5.h,
                  left: 42.w,
                  child: Text(
                    'Sarang',
                    style: GoogleFonts.k2d(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.sp),
                  )),
              Positioned(
                left: 5.w,
                top: 39.h,
                child: SizedBox(
                  width: 91.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '45',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Following',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '10.2m',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '106',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 5.w,
                  top: 45.h,
                  child: SizedBox(
                    width: 91.1.w,
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40.w,
                          height: 5.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              '+FOLLOW',
                              style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          height: 5.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all()),
                          child: Center(
                            child: Text(
                              'MESSAGE',
                              style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  left: 5.w,
                  top: 54.5.h,
                  child: SizedBox(
                    height: 7.h,
                    width: 91.w,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      bottom: TabBar(
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.grey),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.black,
                        automaticIndicatorColorAdjustment: true,
                        indicatorWeight: 2.5.sp,
                        tabs: [
                          Tab(
                            child: Text(
                              'About',
                              style: GoogleFonts.k2d(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Posts',
                              style: GoogleFonts.k2d(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ))
    ]);
  }
}

///My profile ProfileHeader

class MyProfileHeader extends StatefulWidget {
  const MyProfileHeader({Key? key}) : super(key: key);

  @override
  _MyProfileHeaderState createState() => _MyProfileHeaderState();
}

class _MyProfileHeaderState extends State<MyProfileHeader> {
  final MyProfileController myProfileController =
      Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 65.h,
          width: 100.w,
          color: const Color(0xffF5F5F7),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  width: 91.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('Assets/banner.jpg'),
                          fit: BoxFit.fill)),
                ),
              ),
              Positioned(
                  left: 35.w,
                  top: 16.5.h,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 15.w,
                    backgroundImage: const AssetImage('Assets/me.jpg'),
                  )),
              Positioned(
                  top: 33.5.h,
                  left: 42.w,
                  child: GetBuilder<MyProfileController>(
                    builder: (controller) => Text(
                      "${myProfileController.profileModel.user![0].name}",
                      style: GoogleFonts.k2d(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.sp),
                    ),
                  )),
              Positioned(
                left: 5.w,
                top: 39.h,
                child: SizedBox(
                  width: 91.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              '${myProfileController.profileModel.user![0].followings!.length}',
                              style:
                                  GoogleFonts.k2d(fontWeight: FontWeight.bold),
                            ),
                            onTap: () => Get.to(const FollowingFollowers()),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Following',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              '${myProfileController.profileModel.user![0].followers!.length}',
                              style:
                                  GoogleFonts.k2d(fontWeight: FontWeight.bold),
                            ),
                            onTap: () => Get.to(const FollowingFollowers()),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${myProfileController.profileModel.posts![0].files![0].length}',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 5.w,
                  top: 45.h,
                  child: SizedBox(
                    width: 91.1.w,
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // myProfileController.getUserData();
                          },
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                '+ Add to your story',
                                style: GoogleFonts.k2d(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const EditMYProfile()),
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 15.sp,
                                ),
                                Text(
                                  'Edit profile',
                                  style: GoogleFonts.k2d(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  left: 5.w,
                  top: 54.5.h,
                  child: SizedBox(
                    height: 7.h,
                    width: 91.w,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      bottom: TabBar(
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.grey),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.black,
                        automaticIndicatorColorAdjustment: true,
                        indicatorWeight: 2.5.sp,
                        tabs: [
                          Tab(
                            child: Text(
                              'About',
                              style: GoogleFonts.k2d(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Posts',
                              style: GoogleFonts.k2d(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ))
    ]);
  }
}
