import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlogPosts extends StatelessWidget {
  final String apiUrl = "https://medium.com/@akshatamw/latest?format=json";

  Future<List<dynamic>> fetchPosts() async {
    var result = await http.get(apiUrl);
    print(result);
    return json.decode(result.body)['results'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs"),
      ),
      body: Container(
        child: Center(
          child: Text("My Blog posts"),
        ),
      ),
    );
  }
}
