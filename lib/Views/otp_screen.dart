import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:social_media/Views/home_screen.dart';
import 'package:social_media/Views/login_screen.dart';
import 'package:social_media/instance.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

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
              Image.asset('Assets/otp.png'),
              Container(
                // color: Colors.yellow,
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification',
                      style: GoogleFonts.k2d(
                          fontSize: 22.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Please enter the 4 digit code',
                      style: GoogleFonts.k2d(color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    OtpTextField(
                      keyboardType: TextInputType.number,
                      fieldWidth: 15.w,
                      disabledBorderColor: Colors.black,
                      fillColor: Colors.black,
                      enabledBorderColor: Colors.black,
                      numberOfFields: 4,
                      borderColor: Colors.black,
                      showFieldAsBox: false,
                      borderWidth: 4.0,
                      onCodeChanged: (String code) {},
                      onSubmit: (String otp) async {
                       authenticationController.mobileOtpVerify(otp);

                      },
                      cursorColor: Colors.black,
                      focusedBorderColor: Colors.black,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(const LoginScreen());
                      },
                      child: Container(
                        height: 6.h,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                          child: Text(
                            'Verify',
                            style: GoogleFonts.k2d(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't received the OTP?",
                          style: GoogleFonts.k2d(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Resend',
                            style: GoogleFonts.k2d(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
