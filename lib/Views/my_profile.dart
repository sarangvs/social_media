import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Controller/my_profile_controller.dart';
import 'package:social_media/Model/profile/my_profile_model.dart';
import 'package:social_media/Widgets/custom_profile_appbar.dart';
import 'package:social_media/Widgets/profile_header.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);

  MyProfileController profileController = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const MyCustomProfileAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                      color: const Color(0xffF5F5F7),
                      child: const MyProfileHeader()),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Container(
                  height: 10.h,
                  color: const Color(0xffF5F5F7),
                  padding: EdgeInsets.symmetric(horizontal: 13.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            'Lives in Calicut, Kerala',
                            style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Developer||Cars||Dogs',
                            style: GoogleFonts.k2d(color: Colors.grey[700]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                GetBuilder<MyProfileController>(
                  builder: (controller) => FutureBuilder(
                    future: profileController.getUserData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<MyProfileModel> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data!.posts!.length,
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
                                        right: 2.w,
                                        child: IconButton(
                                          onPressed: () {
                                            Get.bottomSheet(Container(
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12))),
                                              child: Column(
                                                children: [
                                                  Material(
                                                    child: ListTile(
                                                      title: Center(
                                                          child: Text(
                                                        "Delete",
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      )),
                                                      onTap: () {
                                                        profileController
                                                            .deletePost(
                                                                profileController
                                                                    .profileModel
                                                                    .posts![
                                                                        index]
                                                                    .sId!);
                                                        controller
                                                            .update();
                                                        Get.back();
                                                      },
                                                    ),
                                                    shadowColor: Colors.grey,
                                                  ),
                                                  const Divider(
                                                    color: Colors.grey,
                                                  ),
                                                  Material(
                                                    child: ListTile(
                                                      title: Center(
                                                          child: Text(
                                                        "Edit",
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      )),
                                                    ),
                                                    shadowColor: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ));
                                          },
                                          icon: FaIcon(
                                            FontAwesomeIcons.ellipsisV,
                                            color: Colors.black,
                                            size: 12.sp,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          child: Row(
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 10.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.sp),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'Assets/me.jpg')),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            '${profileController.profileModel.user![0].name}',
                                            style: GoogleFonts.k2d(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      )),
                                      Positioned(
                                          top: 37.sp,
                                          left: 1.3.w,
                                          child: snapshot.data!.posts![index]
                                                  .files!.isNotEmpty
                                              ? Container(
                                                  height: 44.h,
                                                  width: 87.w,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot
                                                                  .data!
                                                                  .posts![index]
                                                                  .files![0]),
                                                          fit: BoxFit.fitWidth),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                )
                                              : SizedBox(
                                                  height: 44.h,
                                                  width: 87.w,
                                                  child: Center(
                                                    child: Text(
                                                        "${snapshot.data!.posts![index].desc}"),
                                                  ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              snapshot.data!.posts![index]
                                                      .likes!.isNotEmpty
                                                  ? Text(
                                                      '${snapshot.data!.posts![index].likes!.length}',
                                                      style: GoogleFonts.k2d(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : const Text(""),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              snapshot.data!.posts![index]
                                                      .comments!.isNotEmpty
                                                  ? Text(
                                                      'View all ${snapshot.data!.posts![index].comments!.length} comments',
                                                      style: GoogleFonts.k2d(
                                                          color: Colors.grey),
                                                    )
                                                  : const Text('')
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          // itemCount: profileController.profileModel.posts![0].files!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 2.h,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
