import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Views/activity_screen.dart';
import 'package:social_media/Views/home_screen.dart';
import 'package:social_media/Views/my_profile_screen.dart';
import 'package:social_media/Views/search_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ActivityScreen(),
    const MyProfile()
  ];
  int currentIndex = 0;

  setPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: const Center(
        child: Text('Bottom Navi Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setPage(4);
        },
        child: const FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 11.sp),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setPage(0);
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    setPage(1);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 4.w,
              ),
              IconButton(
                  onPressed: () {
                    setPage(2);
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    setPage(3);
                  },
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
      //bottomNavigationBar: const BottomNavBarV2(),
    ));
  }
}
