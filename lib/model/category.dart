// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.id,
    required this.name,
    required this.url,
    required this.imageSrc,
    required this.parentId,
  });

  int id;
  String name;
  String url;
  String imageSrc;
  int? parentId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    imageSrc: json["image_src"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "image_src": imageSrc,
    "parent_id": parentId == null ? null : parentId,
  };
}
