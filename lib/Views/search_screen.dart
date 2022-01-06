import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media/Controller/search_user_controller.dart';
import 'package:social_media/Model/search/search_user_model.dart';
import 'package:social_media/Views/user_profile_screen.dart';
import '../instance.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchUserController _searchUserController =
      Get.put(SearchUserController());

  List<SearchUser> foundUsers = [];

  void runSearchFilter(String value) {
    List<SearchUser> searchResult = [];
    if (value.isEmpty) {
      searchResult = _searchUserController.results;
      print(_searchUserController.results[_searchUserController.index].name);
      print(
          "search result ::${searchResult[_searchUserController.index].name}");
    } else {
      searchResult = _searchUserController.results
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundUsers = searchResult;
      print(foundUsers[_searchUserController.index].name);
    });
  }

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
          title: TextFormField(
            onChanged: (value) => runSearchFilter(value),
            controller: searchUserController.searchController,
            decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(CupertinoIcons.arrow_right),
                  onPressed: () {
                    _searchUserController.getFriendsData();
                  },
                ),
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
            foundUsers.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text('${foundUsers[index].name}'),
                          subtitle: Text("${foundUsers[index].username}"),
                          leading: Container(
                            height: 8.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${foundUsers[index].profilePhotos ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'}"),
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
                  )
                : const Center(
                    child: Text("Search User"),
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
