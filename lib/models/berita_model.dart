import 'dart:convert';

class BeritaModel {
  BeritaModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final dynamic message;
  final Data? data;

  factory BeritaModel.fromJson(Map<String, dynamic> json){
    return BeritaModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.link,
    required this.description,
    required this.title,
    required this.image,
    required this.posts,
  });

  final String? link;
  final String? description;
  final String? title;
  final String? image;
  final List<Post> posts;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      link: json["link"],
      description: json["description"],
      title: json["title"],
      image: json["image"],
      posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "link": link,
    "description": description,
    "title": title,
    "image": image,
    "posts": posts.map((x) => x.toJson()).toList(),
  };

}

class Post {
  Post({
    required this.link,
    required this.title,
    required this.pubDate,
    required this.description,
    required this.thumbnail,
  });

  final String? link;
  final String? title;
  final DateTime? pubDate;
  final String? description;
  final String? thumbnail;

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      link: json["link"],
      title: json["title"],
      pubDate: DateTime.tryParse(json["pubDate"] ?? ""),
      description: json["description"],
      thumbnail: json["thumbnail"],
    );
  }

  Map<String, dynamic> toJson() => {
    "link": link,
    "title": title,
    "pubDate": pubDate?.toIso8601String(),
    "description": description,
    "thumbnail": thumbnail,
  };

}