import 'package:flutter/cupertino.dart';

class Blog {
  const Blog({
    @required this.id,
    @required this.content,
    @required this.title,
    @required this.img,
  })  : assert(id != null),
        assert(img != null),
        assert(content != null),
        assert(title != null);

  final int id;
  final String title;
  final String img;
  final String content;
}
