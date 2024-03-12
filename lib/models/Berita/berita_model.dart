import 'dart:convert';

BeritaModel newsModelFromJson(String str) => BeritaModel.fromJson(json.decode(str));

String newsModelToJson(BeritaModel data) => json.encode(data.toJson());

class BeritaModel {
  BeritaModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final dynamic message;
  final Data? data;

  BeritaModel copyWith({
    bool? success,
    dynamic? message,
    Data? data,
  }) {
    return BeritaModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

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

  @override
  String toString(){
    return "$success, $message, $data, ";
  }
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

  Data copyWith({
    String? link,
    String? description,
    String? title,
    String? image,
    List<Post>? posts,
  }) {
    return Data(
      link: link ?? this.link,
      description: description ?? this.description,
      title: title ?? this.title,
      image: image ?? this.image,
      posts: posts ?? this.posts,
    );
  }

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
    "posts": posts.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$link, $description, $title, $image, $posts, ";
  }
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

  Post copyWith({
    String? link,
    String? title,
    DateTime? pubDate,
    String? description,
    String? thumbnail,
  }) {
    return Post(
      link: link ?? this.link,
      title: title ?? this.title,
      pubDate: pubDate ?? this.pubDate,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

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

  @override
  String toString(){
    return "$link, $title, $pubDate, $description, $thumbnail, ";
  }
}

