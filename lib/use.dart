

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tripers/view/RegisterPages/signin_screen.dart';
import 'package:tripers/view/RegisterPages/signup_screen.dart';
import 'package:tripers/colors.dart' as colors;
import '../../widgets.dart';

class EmailPhone extends StatelessWidget {
  const EmailPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color myHexColor = colors.backGround;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.darken),
                  image: const AssetImage(
                    'assets/images/bg.jpg',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: 100.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/icons/circleavatar.png',
                              scale: 3,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          // const Center(child: Icon(FontAwesomeIcons.user,size: 150,color: Colors.grey)),
                          Container(
                            height: 50,
                            child: AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              bottom: const TabBar(
                                tabs: [
                                  Tab(
                                    child: Text(
                                      'PHONE NUMBER',
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'EMAIL ADDRESS',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: .0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 7.h,
                                        child: TextFormField(
                                          style:  TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp),
                                          decoration: InputDecoration(
                                            prefixIcon: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'IN+91',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            hintText: "Phone number",
                                            hintStyle:  TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.sp),
                                            filled: true,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        'You may receive SMS updates from travel and can opt out at any time',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10.sp),
                                      ),
                                      SizedBox(
                                        height:2.h,
                                      ),
                                      elevatedButtons('Next',const SignUp(),myHexColor),
                                    ],
                                  ),
                                ),

                                /// second tab bar view widget
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 7.h,
                                        child: TextFormField(
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                          decoration: InputDecoration(
                                            hintText: "Email address",
                                            hintStyle:  TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.sp),
                                            filled: true,
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5.0),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.sp,
                                      ),
                                      elevatedButtons('Next',const SignUp(),myHexColor),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.grey,
                            ),
                          ),
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Colors.grey, // red as border color
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              color: Colors.grey,
                            ),
                          ),
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Colors.grey, // red as border color
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        // Container(
                        //   child: IconButton(
                        //     onPressed: (){},
                        //     icon: Icon(FontAwesomeIcons.google),
                        //   ),
                        //   width: 50,
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(
                        //         width: 2.0,
                        //         color: Colors.grey, // red as border color
                        //       ),
                        //       borderRadius: BorderRadius.circular(10)),
                        // ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                            onTap: () => Get.to(const SignIn()),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  indicator: UnderlineTabIndicator(
  // color for indicator (underline)
  borderSide: BorderSide(color: Colors.grey),
  ),
  labelColor: Colors.black,
  indicatorColor: Colors.black,
  unselectedLabelColor: Colors.grey,
  unselectedLabelStyle: TextStyle(fontSize: 15, fontFamily: 'Title'),
  labelStyle: TextStyle(
  fontSize: 15, fontFamily: 'Title', fontWeight: FontWeight.w500),
}


///my user page

SafeArea(
child: Scaffold(
backgroundColor: const Color(0xffF5F5F5),
appBar: AppBar(
backgroundColor: const Color(0xffF5F5F5),
elevation: 0,
actions: [
IconButton(
onPressed: () {},
icon: FaIcon(
FontAwesomeIcons.ellipsisV,
color: Colors.black,
size: 12.sp,
))
],
),
body: Padding(
padding: EdgeInsets.symmetric(horizontal: 13.sp),
child: Column(
children: [
Expanded(
child: SingleChildScrollView(
child: Container(
height: screenHeight,
width: screenWidth,
color: const Color(0xffF5F5F7),
child: Stack(
children: [
Container(
height: 26.h,
width: 91.w,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
image: const DecorationImage(
image: AssetImage('Assets/banner.jpg'),
fit: BoxFit.fill)),
),
Positioned(
left: 29.w,
top: 17.5.h,
child: CircleAvatar(
backgroundColor: Colors.transparent,
radius: 50.sp,
backgroundImage:
const AssetImage('Assets/me.jpg'),
)),
Positioned(
top: 34.h,
left: 38.w,
child: Text(
'Sarang',
style: GoogleFonts.k2d(
fontWeight: FontWeight.bold,
fontSize: 15.sp),
)),
Positioned(
top: 39.h,
child: SizedBox(
width: 91.w,
child: Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment:
CrossAxisAlignment.center,
children: [
Text(
'45',
style: GoogleFonts.k2d(
fontWeight: FontWeight.bold),
),
SizedBox(
height: 1.h,
),
Text(
'Following',
style:
TextStyle(color: Colors.grey[700]),
)
],
),
Column(
crossAxisAlignment:
CrossAxisAlignment.center,
children: [
Text(
'10.2m',
style: GoogleFonts.k2d(
fontWeight: FontWeight.bold),
),
SizedBox(
height: 1.h,
),
Text(
'Followers',
style:
TextStyle(color: Colors.grey[700]),
)
],
),
Column(
crossAxisAlignment:
CrossAxisAlignment.center,
children: [
Text(
'106',
style: GoogleFonts.k2d(
fontWeight: FontWeight.bold),
),
SizedBox(
height: 1.h,
),
Text(
'Posts',
style:
TextStyle(color: Colors.grey[700]),
)
],
)
],
),
),
),
Positioned(
top: 45.h,
child: SizedBox(
width: 91.1.w,
height: 10.h,
child: Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
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
borderRadius:
BorderRadius.circular(12),
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
unselectedLabelColor: Colors.red,
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
// TabBarView(
//     children: [
//      Text('hiiiii'),
//       Text('Helooooo')
//     ]
// )

],
),
),
),
)
],
),
),
),
),