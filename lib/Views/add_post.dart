import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/instance.dart';
import 'dart:io';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'New Post',
          style: GoogleFonts.k2d(fontSize: 12.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          TextButton(
            onPressed: () async {
               await postController.postImage(postController.image);
            },
            child: Text(
              'Done',
              style: GoogleFonts.k2d(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage("Assets/me.jpg"),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Sarang",
                              style:
                                  GoogleFonts.k2d(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        controller: postController.descriptionController,
                        decoration: InputDecoration(
                          hintText: "Say Something...",
                          hintStyle: GoogleFonts.k2d(),
                          enabled: true,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                          child: postController.image == null
                              ? const Center(
                                  child: Text("Pick Image"),
                                )
                              : Image.file(
                                  File(postController.image!.path).absolute,
                                  height: 50.h,
                                  width: 100.w,
                                  fit: BoxFit.cover,
                                ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () async {
          await postController.getImage();
          postController.update();
        },
        child: const Icon(
          CupertinoIcons.photo_fill_on_rectangle_fill,
        ),
      ),
    ));
  }
}
