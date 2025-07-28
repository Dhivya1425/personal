import 'dart:convert';

import 'package:learning/Login/model/login_user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://reqres.in/api/users';

  Future<String> createUser(LoginUser user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return 'User Created: ${data['id']}';
    } else {
      throw Exception('Failed to create user');
    }
  }
}