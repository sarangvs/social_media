import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Controller/authentication_controller.dart';
import 'package:social_media/Views/otp_screen.dart';
import 'package:social_media/instance.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'Assets/signup2.png',
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                  height: 1,
                  indent: 10.w,
                  endIndent: 10.w,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Form(
                      key: AuthenticationController.signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: GoogleFonts.k2d(
                                fontWeight: FontWeight.w700, fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                            controller:
                                authenticationController.fullNameController,
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
                            validator: (validate) {
                              return authenticationController
                                  .validateFullName(validate!);
                            },
                          ),
                          SizedBox(
                            height: 1.1.h,
                          ),
                          TextFormField(
                              controller:
                                  authenticationController.userNameController,
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
                              validator: (validate) {
                                return authenticationController
                                    .validateUserName(validate!);
                              }),
                          SizedBox(
                            height: 1.1.h,
                          ),
                          TextFormField(
                            controller:
                                authenticationController.phoneController,
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
                            validator: (validate) {
                              return authenticationController
                                  .validatePhone(validate!);
                            },
                          ),
                          SizedBox(
                            height: 1.1.h,
                          ),
                          TextFormField(
                            controller:
                                authenticationController.passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.k2d(fontSize: 11.sp),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 17.sp,
                                color: Colors.grey,
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0)),
                            ),
                            obscureText: true,
                            validator: (validate) {
                              return authenticationController
                                  .validatePassword(validate!);
                            },
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final value =
                              await authenticationController.signUp();
                              if (value == "send") {
                                Get.to(const OtpScreen());
                              }

                            },
                            child: Container(
                              height: screenHeight * 0.06,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.k2d(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
