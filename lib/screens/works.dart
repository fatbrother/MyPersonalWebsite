import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:my_personal_website/modules/repo.dart';
import 'package:my_personal_website/utilities/crawler.dart';
import 'package:my_personal_website/utilities/design.dart';
import 'package:my_personal_website/widgets/page_box.dart';
import 'package:my_personal_website/widgets/repo_list.dart';
import 'package:my_personal_website/widgets/see_more_button.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  List<Repo> repos = [];
  Map<String, Color> colors = {};

  Future<void> loadRepoInfo() async {
    String content = '';
    try {
      content =
          await Crawler.getApi('https://api.github.com/users/fatbrother/repos');
    } catch (e) {
      debugPrint('Error1 in works: $e');
    }
    try {
      for (var repo in json.jsonDecode(content)) {
        repos.add(Repo.fromMap(repo));
        if (repos.last.description == '' ||
            repos.last.description == null ||
            repos.last.name == '' ||
            repos.last.name == null ||
            repos.last.language == '' ||
            repos.last.language == null) {
          repos.removeLast();
        }
      }
      repos.shuffle();
    } catch (e) {
      debugPrint('Error2 in works: $e');
    }
  }

  Future<void> getGitHubLangColors() async {
    String content = '';
    try {
      content = await Crawler.getApi(
          'https://raw.githubusercontent.com/ozh/github-colors/master/colors.json');
    } catch (e) {
      debugPrint('Error3 in works: $e');
    }
    try {
      Map tmp = json.jsonDecode(content);
      for (var key in tmp.keys) {
        String? hexCode = tmp[key]['color'];
        if (hexCode == null) {
          continue;
        }
        String rgbaCode = hexCode.replaceFirst(RegExp(r'#'), '0XFF');
        colors[key] = Color(int.parse(rgbaCode));
      }
    } catch (e) {
      debugPrint('Error4 in works: $e');
    }
  }

  Future<void> loadInfo() async {
    await loadRepoInfo();
    await getGitHubLangColors();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    return PageBox(
      backgroundColor: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.fromLTRB(
        Design.getMatirialWidth(context) * 0.15,
        Design.getMatirialHeight(context) * 0.08,
        Design.getMatirialWidth(context) * 0.15,
        Design.getMatirialHeight(context) * 0.08,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Works',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 2.0,
                width: Design.getMatirialWidth(context) * 0.2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          RepoList(repos: repos, colors: colors),
          const Center(child: SeeMoreButton()),
        ],
      ),
    );
  }
}
