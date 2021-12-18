import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class Base64 {
  static Uint8List imageFromBase64String(String base64String) {
    final UriData? data = Uri.parse(base64String).data;
    Uint8List image = data!.contentAsBytes();

    return image;
  }
}