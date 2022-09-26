import 'package:flutter/material.dart';

import 'package:task/constants/images.dart';

class RepoListView extends StatelessWidget {
  RepoListView(
      {Key? key,
      required this.avatar,
      required this.title,
      required this.subTitle,
      required this.login,
      required this.starCount})
      : super(key: key);
  String avatar;
  String title;
  String subTitle;
  String login;
  int starCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: const AssetImage(Images.gitHubPng),
        backgroundColor: Colors.transparent,
        child: Image.network(avatar),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User name -> " + login,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.red,
          ),
          Text(
            "Repo -> " + title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Text(subTitle),
      trailing: Column(
        children: [
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          Text(starCount.toString()),
        ],
      ),
    );
  }
}
