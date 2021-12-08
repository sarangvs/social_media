import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        title: Text(
          'Messages',
          style: GoogleFonts.k2d(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 19.sp),
        ),
        titleSpacing: -14,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.sp),
        child: FutureBuilder(
          builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(10),
                  child: ListTile(
                    leading:  const CircleAvatar(
                      backgroundImage: AssetImage('Assets/me.jpg'),
                    ),
                    title: Text(
                      'Sarang',
                      style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Hello..!!'),
                    trailing: const Text('14:00'),
                  ),
                );
              },
              itemCount: 8,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 2.h,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
