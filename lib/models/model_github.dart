import 'dart:convert';

GithubRepos githubReposFromJson(String str) =>
    GithubRepos.fromJson(json.decode(str));

String githubReposToJson(GithubRepos data) => json.encode(data.toJson());

class GithubRepos {
  GithubRepos({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  int totalCount;
  bool incompleteResults;
  List<Item> items;

  factory GithubRepos.fromJson(Map<String, dynamic> json) => GithubRepos(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.owner,
    required this.description,
    required this.stargazersCount,
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  Owner owner;
  String? description;
  int stargazersCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        owner: Owner.fromJson(json["owner"]),
        description: json["description"],
        stargazersCount: json["stargazers_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "owner": owner.toJson(),
        "description": description,
        "stargazers_count": stargazersCount,
      };
}

class Owner {
  Owner({
    required this.login,
    required this.avatarUrl,
  });

  String login;
  String avatarUrl;
  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
      };
}
