import 'package:flutter/foundation.dart';
import 'package:insta_loader/models/post.dart';

class HomeProvider extends ChangeNotifier {
  List<Post> _posts = [
    const Post(name: 'name', url: 'url'),
    const Post(name: 'name', url: 'url'),
    const Post(name: 'name', url: 'url'),
    const Post(name: 'name', url: 'url'),
  ];

  List<Post> get posts {
    return _posts;
  }

  void setPosts(List<Post> value) {
    _posts = value;
    notifyListeners();
  }

  void addPost(Post value) {
    _posts.add(value);
    notifyListeners();
  }

  void goToPostScreen(Post value) {
    //TODO: set navigation to post screen
  }
}
