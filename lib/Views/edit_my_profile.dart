import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class EditMYProfile extends StatelessWidget {
  const EditMYProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F7),
        appBar: AppBar(
          title: Text(
            'Edit profile',
            style: GoogleFonts.k2d(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffF5F5F7),
          elevation: 0,
          leading: TextButton(
            child: Text(
              'cancel',
              style: GoogleFonts.k2d(fontSize: 10.sp, color: Colors.black),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              child: Text(
                'Done',
                style: GoogleFonts.k2d(
                    fontSize: 10.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100.h,
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
                        left: 57.5.w,
                        top: 26.h,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 4.5.w,
                          child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.camera,
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Positioned(
                        left: 84.w,
                        top: 21.h,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 4.5.w,
                          child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.camera,
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Positioned(
                        right: 7.w,
                        left: 7.w,
                        top: 36.h,
                        child: SizedBox(
                          height: 40.h,
                          width: 80.w,
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    hintStyle: GoogleFonts.k2d(fontSize: 11.sp),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 17.sp,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0))),
                              ),
                              SizedBox(
                                height: 1.1.h,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'User Name',
                                    hintStyle: GoogleFonts.k2d(fontSize: 11.sp),
                                    prefixIcon: Icon(
                                      Icons.verified_user,
                                      size: 17.sp,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0))),
                              ),
                              SizedBox(
                                height: 1.1.h,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Email Id or Phone',
                                    hintStyle: GoogleFonts.k2d(fontSize: 11.sp),
                                    prefixIcon: Icon(
                                      Icons.alternate_email_sharp,
                                      size: 17.sp,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0))),
                              ),
                              SizedBox(
                                height: 1.1.h,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: '            About',
                                    hintStyle: GoogleFonts.k2d(fontSize: 11.sp),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0))),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
