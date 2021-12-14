import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/instance.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 11.h,

          elevation: 0,
          centerTitle: true,
          title: const TextField(
            decoration: InputDecoration(
                hintText: 'Search', prefixIcon: Icon(Icons.search,color: Colors.black,),
            filled: true,
              border: InputBorder.none
            ),
          ),
          bottom:  const TabBar(
            padding: EdgeInsets.only(top: 0.5),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(child: Text('Top')),
              Tab(child: Text('Accounts')),
              Tab(child: Text('Places'),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Top Post'),),
            Center(child: Text('Accounts'),),
            Center(child: Text('Places'),)
          ],
        ),
      ),
    );
  }

}
