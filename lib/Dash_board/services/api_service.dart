import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/comment_model.dart';
import '../model/post_model.dart';
import '../model/user_nodel.dart';


class ApiService{
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    final url = Uri.parse('$baseUrl/users');
    final response = await http.get(url,headers: {"authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBMzAxMjEiLCJpYXQiOjE3NTIyMjMxNTcsImV4cCI6MTc1OTk0ODIwMH0.y5QR2Dpnqto0QeN018sY0xyBko_7TJUTTcR7jSQKRaAso7_xf8SvtIJwZKlxWyWMvJTvvUJnoxrZev8mzHGOFw"});
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url,headers: {"authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBMzAxMjEiLCJpYXQiOjE3NTIyMjMxNTcsImV4cCI6MTc1OTk0ODIwMH0.y5QR2Dpnqto0QeN018sY0xyBko_7TJUTTcR7jSQKRaAso7_xf8SvtIJwZKlxWyWMvJTvvUJnoxrZev8mzHGOFw"});

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Comment>> fetchComments() async {
    final url = Uri.parse('$baseUrl/comments');
    final response = await http.get(url,headers: {"authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJBMzAxMjEiLCJpYXQiOjE3NTIyMjMxNTcsImV4cCI6MTc1OTk0ODIwMH0.y5QR2Dpnqto0QeN018sY0xyBko_7TJUTTcR7jSQKRaAso7_xf8SvtIJwZKlxWyWMvJTvvUJnoxrZev8mzHGOFw"});
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => Comment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}