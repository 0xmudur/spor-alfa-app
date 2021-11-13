import 'dart:convert';
import 'package:http/http.dart' as http;

class WebService {
  static final WebService _instance = WebService._internal();

  WebService._internal();

  factory WebService() => _instance;

  String baseURL = 'http://gncmobil.ozelyazilimistanbul.com';

  /// General Post method
  Future<Map<String, dynamic>> createNewUser(user) async {
    final response = await http.post(
      Uri.parse(baseURL + '/api/newuser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "isActive": user.isActive,
        "userNameSurname": user.nameSurname,
        "userPhone": user.userPhone,
        "userTCKN": user.userTCKN
      }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  /// General GET Method
  Future<Map<String, dynamic>> getAllUsersPhoneNumber() async {
    final response =
        await http.get(Uri.parse(baseURL + '/api/phoneList'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode.toString());
      throw Exception('Failed to load get all users phone number');
    }
  }
}
