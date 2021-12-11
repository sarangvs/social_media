import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffF5F5F5),
            appBar: AppBar(
              backgroundColor: const Color(0xffF5F5F5),
              titleSpacing: -10,
              elevation: 0,
              toolbarHeight: 9.h,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('Assets/me.jpg'),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Sarang',
                        style: GoogleFonts.k2d(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        'online',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
          body: Container(),
        ));
  }
}
