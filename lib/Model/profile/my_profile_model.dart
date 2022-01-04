class MyProfileModel {
  List<User>? user;
  List<Posts>? posts;

  MyProfileModel({this.user, this.posts});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user =  <User>[];
      json['user'].forEach((v) {
        user?.add( User.fromJson(v));
      });
    }
    if (json['posts'] != null) {
      posts =  <Posts>[];
      json['posts'].forEach((v) {
        posts?.add( Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? password;
  String? date;
  String? name;
  String? username;
  bool? emailVerified;
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
  List<dynamic>? followings;
  List<dynamic>? followers;
  List<dynamic>? profilePhotos;
  String? coverPhoto;
  List<String>? savedPost;

  User(
      {this.sId,
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

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    date = json['date'];
    name = json['name'];
    username = json['username'];
    emailVerified = json['emailVerified'];
    isActive = json['isActive'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    highersecondary = json['highersecondary'];
    highschool = json['highschool'];
    hometown = json['hometown'];
    phone = json['phone'];
    pincode = json['pincode'];
    qualification = json['qualification'];
    state = json['state'];
    workingplace = json['workingplace'];
    college = json['college'];
    employstatus = json['employstatus'];
    followings = json['followings'];
    followers = json['followers'];
    profilePhotos = json['ProfilePhotos'];
    coverPhoto = json['coverPhoto'];
    savedPost = json['SavedPost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['password'] = password;
    data['date'] = date;
    data['name'] = name;
    data['username'] = username;
    data['emailVerified'] = emailVerified;
    data['isActive'] = isActive;
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['highersecondary'] = highersecondary;
    data['highschool'] = highschool;
    data['hometown'] = hometown;
    data['phone'] = phone;
    data['pincode'] = pincode;
    data['qualification'] = qualification;
    data['state'] = state;
    data['workingplace'] = workingplace;
    data['college'] = college;
    data['employstatus'] = employstatus;
    data['followings'] = followings;
    data['followers'] = followers;
    data['ProfilePhotos'] = profilePhotos;
    data['coverPhoto'] = coverPhoto;
    data['SavedPost'] = savedPost;
    return data;
  }
}

class Posts {
  String? sId;
  String? desc;
  List<String>? files;
  String? location;
  List<Tag>? tag;
  String? accessibility;
  List<String>? likes;
  List<String>? comments;
  String? userId;
  String? status;
  int? report;
  String? postedDate;
  User? user;

  Posts(
      {this.sId,
        this.desc,
        this.files,
        this.location,
        this.tag,
        this.accessibility,
        this.likes,
        this.comments,
        this.userId,
        this.status,
        this.report,
        this.postedDate,
        this.user});

  Posts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    desc = json['desc'];
    files = json['files'].cast<String>();
    location = json['location'];
    if (json['tag'] != null) {
      tag =  <Tag>[];
      json['tag'].forEach((v) {
        tag?.add( Tag.fromJson(v));
      });
    }
    accessibility = json['Accessibility'];
    likes = json['likes'].cast<String>();
    comments = json['comments'].cast<String>();
    userId = json['userId'];
    status = json['status'];
    report = json['report'];
    postedDate = json['postedDate'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['desc'] = desc;
    data['files'] = files;
    data['location'] = location;
    if (tag != null) {
      data['tag'] = tag?.map((v) => v.toJson()).toList();
    }
    data['Accessibility'] = accessibility;
    data['likes'] = likes;
    data['comments'] = comments;
    data['userId'] = userId;
    data['status'] = status;
    data['report'] = report;
    data['postedDate'] = postedDate;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}

class Tag {
  String? sId;
  String? name;

  Tag({this.sId, this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class UserProfilePhoto {
  String? sId;
  String? name;
  String? profilePhotos;

  UserProfilePhoto({this.sId, this.name, this.profilePhotos});

  UserProfilePhoto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    profilePhotos = json['ProfilePhotos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['ProfilePhotos'] = profilePhotos;
    return data;
  }
}
