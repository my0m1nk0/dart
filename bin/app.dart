import 'dart:convert';

import 'package:http/http.dart' as http;

import 'post.dart';

// Await the http get response, then decode the json-formatted response.

void app() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
  await http.get(url).then((res) {
    var rawData = res.body;
    List decodeData = jsonDecode(rawData) as List;

    List<Post> posts = decodeData.map((e) => Post.from(e)).toList();

    // List<Post> posts = [];
    // decodeData.forEach((data) {
    //   var post = new Post(
    //       userId: data["userId"],
    //       id: data["id"],
    //       title: data["title"],
    //       body: data["body"]);

    //   posts.add(post);
    // });

    print(posts.length);
    posts.forEach((element) {
      print(element.id);
    });
    // ignore: invalid_return_type_for_catch_error
  }).catchError((e) => print(e));
}
