

class AllPost {
  String? message;
  List<Posts>? posts;

  AllPost({
    this.message,
    this.posts,
  });

  AllPost.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    posts = (json['posts'] as List?)?.map((dynamic e) => Posts.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    json['posts'] = posts?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Posts {
  String? id;
  String? desc;
  List<dynamic>? files;
  String? location;
  List<dynamic>? tag;
  String? accessibility;
  List<dynamic>? likes;
  List<dynamic>? comments;
  String? userId;
  String? status;
  int? report;
  String? postedDate;
  User? user;

  Posts({
    this.id,
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
    this.user,
  });

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    desc = json['desc'] as String?;
    files = json['files'] as List?;
    location = json['location'] as String?;
    tag = json['tag'] as List?;
    accessibility = json['Accessibility'] as String?;
    likes = json['likes'] as List?;
    comments = json['comments'] as List?;
    userId = json['userId'] as String?;
    status = json['status'] as String?;
    report = json['report'] as int?;
    postedDate = json['postedDate'] as String?;
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['desc'] = desc;
    json['files'] = files;
    json['location'] = location;
    json['tag'] = tag;
    json['Accessibility'] = accessibility;
    json['likes'] = likes;
    json['comments'] = comments;
    json['userId'] = userId;
    json['status'] = status;
    json['report'] = report;
    json['postedDate'] = postedDate;
    json['user'] = user?.toJson();
    return json;
  }
}

class User {
  String? id;
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
  List<String>? followings;
  List<String>? followers;
  List<String>? profilePhotos;
  String? coverPhoto;
  List<String>? savedPost;

  User({
    this.id,
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
    this.savedPost,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    email = json['email'] as String?;
    password = json['password'] as String?;
    date = json['date'] as String?;
    name = json['name'] as String?;
    username = json['username'] as String?;
    emailVerified = json['emailVerified'] as bool?;
    isActive = json['isActive'] as bool?;
    address1 = json['address1'] as String?;
    address2 = json['address2'] as String?;
    city = json['city'] as String?;
    highersecondary = json['highersecondary'] as String?;
    highschool = json['highschool'] as String?;
    hometown = json['hometown'] as String?;
    phone = json['phone'] as String?;
    pincode = json['pincode'] as String?;
    qualification = json['qualification'] as String?;
    state = json['state'] as String?;
    workingplace = json['workingplace'] as String?;
    college = json['college'] as String?;
    employstatus = json['employstatus'] as String?;
    followings = (json['followings'] as List?)?.map((dynamic e) => e as String).toList();
    followers = (json['followers'] as List?)?.map((dynamic e) => e as String).toList();
    profilePhotos = (json['ProfilePhotos'] as List?)?.map((dynamic e) => e as String).toList();
    coverPhoto = json['coverPhoto'] as String?;
    savedPost = (json['SavedPost'] as List?)?.map((dynamic e) => e as String).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['email'] = email;
    json['password'] = password;
    json['date'] = date;
    json['name'] = name;
    json['username'] = username;
    json['emailVerified'] = emailVerified;
    json['isActive'] = isActive;
    json['address1'] = address1;
    json['address2'] = address2;
    json['city'] = city;
    json['highersecondary'] = highersecondary;
    json['highschool'] = highschool;
    json['hometown'] = hometown;
    json['phone'] = phone;
    json['pincode'] = pincode;
    json['qualification'] = qualification;
    json['state'] = state;
    json['workingplace'] = workingplace;
    json['college'] = college;
    json['employstatus'] = employstatus;
    json['followings'] = followings;
    json['followers'] = followers;
    json['ProfilePhotos'] = profilePhotos;
    json['coverPhoto'] = coverPhoto;
    json['SavedPost'] = savedPost;
    return json;
  }
}