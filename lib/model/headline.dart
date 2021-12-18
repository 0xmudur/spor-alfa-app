// To parse this JSON data, do
//
//     final headline = headlineFromJson(jsonString);

import 'dart:convert';

import 'package:spor_alfa_app/utils/html_parser.dart';

Headline headlineFromJson(String str) => Headline.fromJson(json.decode(str));

String headlineToJson(Headline data) => json.encode(data.toJson());

class Headline {
  Headline({
    required this.totalRecords,
    required this.items,
  });

  int totalRecords;
  List<Item> items;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
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
    required this.main,
    required this.news,
  });

  int id;
  bool main;
  News news;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    main: json["main"],
    news: News.fromJson(json["news"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "news": news.toJson(),
  };
}

class News {
  News({
    required this.id,
    required this.title,
    required this.body,
    required this.imageSrc,
    required this.published,
    required this.publishedAt,
    required this.article,
    required this.categoryId,
    required this.editor,
  });

  int id;
  String title;
  String body;
  String imageSrc;
  bool published;
  DateTime publishedAt;
  bool article;
  int categoryId;
  Editor editor;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    title: json["title"],
    body: HtmlTags.removeTag(htmlString: json["body"]),
    imageSrc: json["image_src"],
    published: json["published"],
    publishedAt: DateTime.parse(json["published_at"]),
    article: json["article"],
    categoryId: json["category_id"],
    editor: Editor.fromJson(json["editor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "image_src": imageSrc,
    "published": published,
    "published_at": publishedAt.toIso8601String(),
    "article": article,
    "category_id": categoryId,
    "editor": editor.toJson(),
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
