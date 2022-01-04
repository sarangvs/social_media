import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Views/activity_screen.dart';
import 'package:social_media/Views/add_post.dart';
import 'package:social_media/Views/home_screen.dart';
import 'package:social_media/Views/my_profile.dart';
import 'package:social_media/Views/search_screen.dart';
import 'package:social_media/instance.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var pages = [
    const HomeScreen(),
     SearchScreen(),
    const ActivityScreen(),
     MyProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
              children: pages
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => Get.to(const AddPost()),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:  Material(
              color: Colors.white,
              child: SizedBox(
                height: 8.h,
                child: const TabBar(
                  indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: <Widget>[
                      Tab(
                          icon: Icon(
                            Icons.home,
                            size: 28,
                          ),
                          ),
                      Tab(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Icon(
                              Icons.search,
                              size: 28,
                            ),
                          ),
                          ),
                      Tab(
                          icon: Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Icon(
                              Icons.favorite_border,
                              size: 28,
                            ),
                          ),
                         ),
                      Tab(
                          icon: Icon(
                            Icons.person_outline,
                            size: 28,
                          ),
                        ),
                    ]),
              ),
            ),
          ),
        ));
  }

}
