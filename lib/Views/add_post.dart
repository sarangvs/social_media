import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('New Post',style: GoogleFonts.k2d(fontSize: 12.sp),),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              icon:Icon(Icons.close),
              onPressed: (){
                Get.back();
              },
            ),
            actions: [
              TextButton(
                onPressed: (){},
                child: Text('Done',style: GoogleFonts.k2d(color: Colors.white),),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              // child: GridView.builder(
              //     gridDelegate: gridDelegate,
              //     itemBuilder: itemBuilder
              // ),
            ),
          ),
        )
    );
  }
}
