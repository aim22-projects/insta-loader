import 'package:flutter/material.dart';
import 'package:insta_loader/models/post.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      child: Scaffold(
        appBar: appBar(),
        body: postsListView(),
        floatingActionButton: addPostButton(),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Home Page'),
    );
  }

  Widget postsListView() {
    return Consumer<HomeProvider>(
      builder: (context, model, child) => ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(model.posts[index].name),
          subtitle: Text(model.posts[index].url),
          leading: const CircleAvatar(child: Icon(Icons.image)),
          onTap: () => model.goToPostScreen(model.posts[index]),
        ),
        itemCount: model.posts.length,
        separatorBuilder: (context, index) => child!,
      ),
      child: const Divider(),
    );
  }

  Widget addPostButton() {
    return Consumer<HomeProvider>(
      builder: (context, model, child) => FloatingActionButton.extended(
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        onPressed: () => model.addPost(
          const Post(name: 'name', url: 'url'),
        ),
      ),
    );
  }
}
