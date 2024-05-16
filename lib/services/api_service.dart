import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_riverpod_api/models/Post.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.org/posts'),
    );
    if (response.statusCode == 200) {
      final mapData = jsonDecode(response.body) as List;
      final postList = mapData.map((e) => Post.fromJson(e)).toList();
      print(postList);
      print(postList.length);
      return postList;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

// providing the api service class
final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);
