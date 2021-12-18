import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/Views/bottom_navscreen.dart';
import 'package:social_media/Views/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('Assets/loginimage.png'),
                Container(
                  // color: Colors.red,
                  width: screenWidth * 0.76,
                  margin: EdgeInsets.only(left: screenWidth * 0.12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.k2d(
                            textStyle: const TextStyle(fontSize: 27),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Email ID or Phone',
                            hintStyle: GoogleFonts.k2d(fontSize: 15),
                            prefixIcon: const Icon(
                              Icons.alternate_email_sharp,
                              size: 20,
                              color: Colors.grey,
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 1.0))),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.k2d(fontSize: 15),
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 20,
                            color: Colors.grey,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const BottomNavScreen());
                        },
                        child: Container(
                          height: screenHeight * 0.06,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Center(
                            child: Text(
                              'Login',
                              style: GoogleFonts.k2d(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Expanded(
                  child: Container(
                    width: screenWidth * 0.76,
                    margin: EdgeInsets.only(left: screenWidth * 0.12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                           Text(
                            'Or Login with...',
                            style: GoogleFonts.k2d(color: Colors.grey[600]),

                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.9, color: Colors.grey)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('Assets/google.png'),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.9, color: Colors.grey)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('Assets/facebook.png'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New to App?',
                              style: GoogleFonts.k2d(color: Colors.grey),
                            ),
                            const SizedBox(width: 7,),
                            InkWell(
                              onTap: () {
                                Get.to(const SignupScreen());
                              },
                              child: Text(
                                'Register',
                                style: GoogleFonts.k2d(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
