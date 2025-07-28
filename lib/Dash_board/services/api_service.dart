import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/comment_model.dart';
import '../model/post_model.dart';
import '../model/user_nodel.dart';


class ApiService{
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String token = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBMzAxMjEiLCJpYXQiOjE3NTM1MTkzNzYsImV4cCI6MTc2MTI0NDIwMH0.56OiaT8-d1FVWfnnrByv92nN2Z5ypwdLwEu24s9QwvQoXGOLt3a1eGaV62dta4_EH6MQQ2_HZ3sCDBmlxBs9QQ";
  Future<List<User>> fetchUsers() async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.get(url,headers: {"authorization" : token});
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url,headers: {"authorization" : token});

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Comment>> fetchComments() async {
    final url = Uri.parse('$baseUrl/comments');
    final response = await http.get(url,headers: {"authorization" : token});
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}