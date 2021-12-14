import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xffF5F5F5),
          title: Text(
            'Settings',
            style: GoogleFonts.k2d(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp),
          ),
          toolbarHeight: 10.h,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          titleSpacing: 1.w,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Account',
                style: GoogleFonts.k2d(
                    fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1.5.sp,
                child: ListTile(
                  title: Text(
                    'Change Password',
                    style: GoogleFonts.k2d(color: Colors.grey[600]),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1.5.sp,
                child: ListTile(
                  title: Text('Security & Privacy',
                      style: GoogleFonts.k2d(color: Colors.grey[600])),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1.5.sp,
                child: ListTile(
                  title: Text('Invite Link',
                      style: GoogleFonts.k2d(color: Colors.grey[600])),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Other',
                style: GoogleFonts.k2d(
                    fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1.5.sp,
                child: ListTile(
                  title: Text(
                    'Notification',
                    style: GoogleFonts.k2d(color: Colors.grey[600]),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1.5.sp,
                child: ListTile(
                  title: Text('Help',
                      style: GoogleFonts.k2d(color: Colors.grey[600])),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1.5.sp,
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text('Log out',
                      style: GoogleFonts.k2d(color: Colors.grey[600])),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                  child: Center(
                      child: Text(
                'AppName 0.1.1',
                style: GoogleFonts.k2d(color: Colors.grey),
              )))
            ],
          ),
        ),
      ),
    );
  }
}
