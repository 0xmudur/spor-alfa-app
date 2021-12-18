import 'dart:typed_data';

class Base64 {

  static Uint8List imageFromBase64String(String base64String) {
    final UriData? data = Uri.parse(base64String).data;
    Uint8List image = data!.contentAsBytes();
    return image;
  }
}