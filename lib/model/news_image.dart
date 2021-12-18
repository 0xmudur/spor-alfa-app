// To parse this JSON data, do
//
//     final newsImage = newsImageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<NewsImage> newsImageFromJson(String str) => List<NewsImage>.from(json.decode(str).map((x) => NewsImage.fromJson(x)));

String newsImageToJson(List<NewsImage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsImage {
  NewsImage({
    required this.image,
    required this.tags,
    required this.filename,
  });

  String image;
  List<String> tags;
  String filename;

  factory NewsImage.fromJson(Map<String, dynamic> json) => NewsImage(
    image: json["image"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    filename: json["filename"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "filename": filename,
  };
}
