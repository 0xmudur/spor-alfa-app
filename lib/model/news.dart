// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:spor_alfa_app/utils/html_parser.dart';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    required this.totalRecords,
    required this.items,
  });

  int totalRecords;
  List<Item> items;

  factory News.fromJson(Map<String, dynamic> json) => News(
    totalRecords: json["totalRecords"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalRecords": totalRecords,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.id,
    required this.title,
    required this.body,
    required this.imageSrc,
    required this.published,
    required this.createdAt,
    required this.publishedAt,
    required this.article,
    required this.categoryId,
    required this.editor,
    required this.headline,
  });

  int id;
  String title;
  String body;
  String imageSrc;
  bool published;
  DateTime createdAt;
  DateTime publishedAt;
  bool article;
  int categoryId;
  Editor editor;
  List<Headline> headline;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    title: json["title"],
    body: HtmlTags.removeTag(htmlString: json["body"]),
    imageSrc: json["image_src"],
    published: json["published"],
    createdAt: DateTime.parse(json["created_at"]),
    publishedAt: DateTime.parse(json["published_at"]),
    article: json["article"],
    categoryId: json["category_id"],
    editor: Editor.fromJson(json["editor"]),
    headline: List<Headline>.from(json["headline"].map((x) => Headline.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "image_src": imageSrc,
    "published": published,
    "created_at": createdAt.toIso8601String(),
    "published_at": publishedAt.toIso8601String(),
    "article": article,
    "category_id": categoryId,
    "editor": editor.toJson(),
    "headline": List<dynamic>.from(headline.map((x) => x.toJson())),
  };
}

class Editor {
  Editor({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.imageSrc,
  });

  int id;
  String username;
  String fullName;
  String email;
  String imageSrc;

  factory Editor.fromJson(Map<String, dynamic> json) => Editor(
    id: json["id"],
    username: json["username"],
    fullName: json["full_name"],
    email: json["email"],
    imageSrc: json["image_src"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "full_name": fullName,
    "email": email,
    "image_src": imageSrc,
  };
}

class Headline {
  Headline({
    required this.id,
    required this.main,
  });

  int id;
  bool main;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
    id: json["id"],
    main: json["main"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
  };
}
