import 'dart:convert';

List<SearchUser> searchFromJson(String str) =>
    List<SearchUser>.from(json.decode(str).map((x) => SearchUser.fromJson(x)));

String searchToJson(List<SearchUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchUser {
  SearchUser({
    this.id,
    this.name,
    this.username,
    this.followings,
    this.profilePhotos,
    this.following,
  });

  String? id;
  String? name;
  String? username;
  List<String>? followings;
  dynamic profilePhotos;
  bool? following;

  factory SearchUser.fromJson(Map<String, dynamic> json) => SearchUser(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        followings: List<String>.from(json["followings"].map((x) => x)),
        profilePhotos: json["ProfilePhotos"],
        following: json["following"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "followings": List<dynamic>.from(followings!.map((x) => x)),
        "ProfilePhotos": profilePhotos,
        "following": following,
      };
}
