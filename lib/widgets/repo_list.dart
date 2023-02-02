import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_personal_website/modules/repo.dart';
import 'package:my_personal_website/utilities/design.dart';
import 'package:my_personal_website/widgets/repo_box.dart';

class RepoList extends StatelessWidget {
  const RepoList({
    Key? key,
    required this.repos,
    required this.colors,
  }) : super(key: key);

  final List<Repo> repos;
  final Map<String, Color> colors;

  int _getRepoCount(BuildContext context) {
    double height = Design.getMatirialHeight(context) * 0.5;
    double width = Design.getMatirialWidth(context) * 0.7;
    double boxWidth = RepoBox.width;
    double boxHeight = RepoBox.height;
    int count = min(6, repos.length);
    count = min(count, (height / boxHeight).floor() * (width / boxWidth).floor());
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Design.getMatirialHeight(context) * 0.5,
      width: Design.getMatirialWidth(context) * 0.7,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 20,
        children: [
          for (int i = 0; i < _getRepoCount(context); i++)
            RepoBox(repo: repos[i], color: colors[repos[i].language]!)
        ],
      ),
    );
  }
}
