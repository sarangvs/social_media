// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsModel $UserDetailsModelFromJson(Map<String, dynamic> json) =>
    UserDetailsModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      date: json['date'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      emailVerified: json['emailVerified'] as String?,
      isActive: json['isActive'] as bool?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      city: json['city'] as String?,
      highersecondary: json['highersecondary'] as String?,
      highschool: json['highschool'] as String?,
      hometown: json['hometown'] as String?,
      phone: json['phone'] as String?,
      pincode: json['pincode'] as String?,
      qualification: json['qualification'] as String?,
      state: json['state'] as String?,
      workingplace: json['workingplace'] as String?,
      college: json['college'] as String?,
      employstatus: json['employstatus'] as String?,
      followings: (json['followings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profilePhotos: (json['profilePhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coverPhoto: json['coverPhoto'] as String?,
      savedPost: (json['savedPost'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> $UserDetailsModelToJson(UserDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'date': instance.date,
      'name': instance.name,
      'username': instance.username,
      'emailVerified': instance.emailVerified,
      'isActive': instance.isActive,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'highersecondary': instance.highersecondary,
      'highschool': instance.highschool,
      'hometown': instance.hometown,
      'phone': instance.phone,
      'pincode': instance.pincode,
      'qualification': instance.qualification,
      'state': instance.state,
      'workingplace': instance.workingplace,
      'college': instance.college,
      'employstatus': instance.employstatus,
      'followings': instance.followings,
      'followers': instance.followers,
      'profilePhotos': instance.profilePhotos,
      'coverPhoto': instance.coverPhoto,
      'savedPost': instance.savedPost,
    };
