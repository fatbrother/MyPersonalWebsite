import 'dart:convert' as json;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_personal_website/utilities/design.dart';
import 'package:my_personal_website/widgets/about_me_list.dart';
import 'package:my_personal_website/widgets/logo_box.dart';
import 'package:my_personal_website/widgets/page_box.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _leetCodeRating = '';
  List<String> files = [];

  Future<void> getLeetCodeRank() async {
    String content = '';
    try {
      String apiUrl =
          'https://leetcode.com/graphql?query=query{userContestRanking(username:%22kevin92422%22){rating}}';
      String corsUrl = 'https://cors-anywhere.herokuapp.com/';
      var result = await http.get(Uri.parse(corsUrl + apiUrl));
      content = result.body;
    } catch (e) {
      debugPrint('Error1 in about: $e');
    }
    try {
      _leetCodeRating = json
          .jsonDecode(content)['data']['userContestRanking']['rating']
          .toString();
    } catch (e) {
      debugPrint('Error2 in about: $e');
    }
  }

  Future<void> getLogoFiles() async {
    try {
      String dirJsonFile = await rootBundle.loadString('logos/all.json');
      String folderName = json.jsonDecode(dirJsonFile)['folderName'];
      List list = json.jsonDecode(dirJsonFile)['files'];
      for (var name in list) {
        files.add('$folderName/$name');
      }
    } catch (e) {
      debugPrint('Error3 in about: $e');
    }
  }

  Future<void> loadInfo() async {
    await getLeetCodeRank();
    await getLogoFiles();
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
    List<String> contents = [
      'ICPC 2022 桃園站 銅牌',
      'NCPC 2022 佳作',
      '北大資工系程式設計社社長',
      'LeetCode Rating: $_leetCodeRating',
      '擅長語言: C++, Dart, Python',
      '擅長框架: SFML, Flutter, Flask',
    ];

    List<CircleAvatar> icons = [
      for (String dir in files)
        CircleAvatar(
            radius: 45,
            backgroundColor: Colors.transparent,
            child: Image.asset(dir)),
    ];

    return PageBox(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Stack(
        children: [
          Positioned(
            top: Design.getMatirialHeight(context) * 0.2,
            right: Design.getMatirialWidth(context) * 0.1,
            child: AboutMeList(contents: contents),
          ),
          Positioned(
            top: Design.getMatirialHeight(context) * 0.1,
            left: Design.getMatirialWidth(context) * 0.1,
            child: LogoBox(icons: icons),
          )
        ],
      ),
    );
  }
}
