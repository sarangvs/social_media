import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FollowingFollowers extends StatelessWidget {
  const FollowingFollowers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffF5F5F5),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            title: Text(
              'Sarang',
              style: GoogleFonts.k2d(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  child: Text('10.2m Followers'),
                ),
                Tab(
                  child: Text('45 Following'),
                )
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                ),
              ),
              Container(
                height: 100.h,
                width: 100.w,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
