import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
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
  });

  Id? id;
  String? desc;
  List<String>? files;
  String? location;
  List<Tag>? tag;
  String? accessibility;
  List<dynamic>? likes;
  List<dynamic>? comments;
  Id? userId;
  String? status;
  int? report;
  DateTime? postedDate;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: Id.fromJson(json["_id"]),
    desc: json["desc"],
    files: List<String>.from(json["files"].map((x) => x)),
    location: json["location"],
    tag: List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
    accessibility: json["Accessibility"],
    likes: List<dynamic>.from(json["likes"].map((x) => x)),
    comments: List<dynamic>.from(json["comments"].map((x) => x)),
    userId: Id.fromJson(json["userId"]),
    status: json["status"],
    report: json["report"],
    postedDate: DateTime.parse(json["postedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id!.toJson(),
    "desc": desc,
    "files": List<dynamic>.from(files!.map((x) => x)),
    "location": location,
    "tag": List<dynamic>.from(tag!.map((x) => x.toJson())),
    "Accessibility": accessibility,
    "likes": List<dynamic>.from(likes!.map((x) => x)),
    "comments": List<dynamic>.from(comments!.map((x) => x)),
    "userId": userId!.toJson(),
    "status": status,
    "report": report,
    "postedDate": postedDate!.toIso8601String(),
  };
}

class Id {
  Id({
    this.oid,
  });

  String? oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    oid: json["\u0024oid"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024oid": oid,
  };
}

class Tag {
  Tag({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
