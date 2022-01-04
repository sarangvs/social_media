import 'package:json_annotation/json_annotation.dart';

part 'user_details_model.g.dart';

@JsonSerializable()
class UserDetailsModel {
  String? id;
  String? email;
  String? password;
  String? date;
  String? name;
  String? username;
  String? emailVerified;
  bool? isActive;
  String? address1;
  String? address2;
  String? city;
  String? highersecondary;
  String? highschool;
  String? hometown;
  String? phone;
  String? pincode;
  String? qualification;
  String? state;
  String? workingplace;
  String? college;
  String? employstatus;
  List<String>? followings;
  List<String>? followers;
  List<String>? profilePhotos;
  String? coverPhoto;
  List<String>? savedPost;

  UserDetailsModel(
      {this.id,
      this.email,
      this.password,
      this.date,
      this.name,
      this.username,
      this.emailVerified,
      this.isActive,
      this.address1,
      this.address2,
      this.city,
      this.highersecondary,
      this.highschool,
      this.hometown,
      this.phone,
      this.pincode,
      this.qualification,
      this.state,
      this.workingplace,
      this.college,
      this.employstatus,
      this.followings,
      this.followers,
      this.profilePhotos,
      this.coverPhoto,
      this.savedPost});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      $UserDetailsModelFromJson(json);
  Map<String,dynamic> toJson()=> $UserDetailsModelToJson(this);
}
