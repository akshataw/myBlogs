import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/domain/rss_feed.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

List blogList = [];

class MyHomePage extends StatelessWidget {
//  final String apiUrl = "https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@akshatamw";
  final String apiUrl = "https://medium.com/feed/@akshatamw";
  http.Response result;
  final Xml2Json xml2json = Xml2Json();

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();

      final response = await client.get(apiUrl);
      return RssFeed.parse(response.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  load() async {
    loadFeed().then((result) {
      if (result == null || result.toString().isEmpty) {
        print("Result is null");
      }
//      print(result.items[0].title);
      blogList = result.items.toList();
      print(blogList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs"),
      ),
      body: Container(
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text('Blog title'),
                  subtitle: Text("Blog description"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Learn More"),
                      onPressed: () {
                        print("Blog Information");
                        load();
//                        fetchPosts();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
