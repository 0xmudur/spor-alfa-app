import 'dart:convert';
import 'package:http/http.dart' as http;

class WebService {
  static final WebService _instance = WebService._internal();

  WebService._internal();

  factory WebService() => _instance;

  String baseURL = 'https://medyalfa.com:5001';

  Future<Map<String, dynamic>> getNews(int limit, int skip) async {
    final response = await http.get(
        Uri.parse(baseURL + '/news/public?limit=${limit}&skip=${skip}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response.statusCode == 200) {
      var decodedResponse = utf8.decode(response.bodyBytes);
      return jsonDecode(decodedResponse);
    } else {

      throw Exception('Failed to load get all users phone number');
    }
  }
}
