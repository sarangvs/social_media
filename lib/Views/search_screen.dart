import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Controller/search_user_controller.dart';
import 'package:social_media/Model/search/search_user_model.dart';
import 'package:social_media/Views/user_profile_screen.dart';

import '../instance.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final SearchUserController _searchUserController =
      Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 11.h,
          elevation: 0,
          centerTitle: true,
          title: TextField(
          //  onChanged: (value) => _searchUserController.runSearch(value),
            controller: searchUserController.searchController,
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: IconButton(
                  onPressed: () {
                    searchUserController.searchUsers();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                filled: true,
                border: InputBorder.none),
          ),
          bottom: const TabBar(
            padding: EdgeInsets.only(top: 0.5),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(child: Text('Accounts')),
              Tab(child: Text('Top')),
              Tab(
                child: Text('Places'),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GetBuilder<SearchUserController>(
              builder: (controller) => FutureBuilder<List<SearchUser>>(
                future: _searchUserController.searchUsers(),
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  print("dataaaaaaaaa$data");
                  if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  } else {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text('${data?[index].name}'),
                            subtitle: Text("${data?[index].username}"),
                            leading: Container(
                              height: 8.h,
                              width: 14.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${data?[index].profilePhotos ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'}"),
                                      fit: BoxFit.fill)),
                            ),
                            onTap: () => Get.to(const UserProfileScreen()),
                          ),
                        );
                      },
                      itemCount: _searchUserController.results.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 0.3.h,
                        );
                      },
                    );
                  }
                },
              ),
            ),
            const Center(
              child: Text('Top'),
            ),
            const Center(
              child: Text('Places'),
            )
          ],
        ),
      ),
    );
  }
}
