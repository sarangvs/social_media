import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:social_media/Views/bottom_navscreen.dart';
import 'package:social_media/Views/login_screen.dart';
import 'package:social_media/instance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Media',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            tabBarTheme: const TabBarTheme(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.blue,
            )),
        home: (authenticationController.loginStatus == false)
            ? const LoginScreen()
            : const BottomNavScreen(),
      );
    });
  }
}
