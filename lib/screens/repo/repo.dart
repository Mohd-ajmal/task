import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:task/constants/images.dart';
import 'package:task/constants/strings.dart';
import 'package:task/hooks/repo_view.dart';
import 'package:task/view_models/github_repo/vm_github.dart';

class Repo extends StatefulWidget {
  const Repo({Key? key}) : super(key: key);

  @override
  State<Repo> createState() => _RepoState();
}

class _RepoState extends State<Repo> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<VmGithub>(context, listen: false);
    provider.onGetRepos(page: "${provider.page}");

    provider.scrollController.addListener(() {
      if (provider.scrollController.position.maxScrollExtent ==
          provider.scrollController.offset) {
        provider.onGetRepos(page: "${provider.page += 1}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VmGithub>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          Images.gitHub,
          color: Colors.white,
          height: 40.0,
          width: 40.0,
        ),
      ),
      body: provider.isProgress == false
          ? provider.error.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                      controller: provider.scrollController,
                      itemBuilder: (context, int index) {
                        return index > provider.values.length - 1
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 32),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : RepoListView(
                                avatar: provider.values[index].owner.avatarUrl,
                                title: provider.values[index].name,
                                subTitle: provider.values[index].description ??
                                    Strings.notSpecified,
                                login: provider.values[index].owner.login,
                                starCount:
                                    provider.values[index].stargazersCount);
                      },
                      separatorBuilder: (context, int index) => const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                      itemCount: provider.values.length + 1))
              : Center(child: Text(provider.error))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
