import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_personal_website/utilities/design.dart';
import 'package:my_personal_website/widgets/about_me_list.dart';
import 'package:my_personal_website/widgets/logo_bax.dart';
import 'package:my_personal_website/widgets/page_box.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _leetCodeRating = '';

  Future<void> getLeetCodeRank() async {
    String content = '';
    try {
      String apiUrl =
          'https://leetcode.com/graphql?query=query{userContestRanking(username:%22kevin92422%22){rating}}';
      String corsUrl = 'https://cors-anywhere.herokuapp.com/';
      var result = await http.get(Uri.parse(corsUrl + apiUrl));
      content = result.body;
    } catch (e) {
      debugPrint('Error: $e');
    }
    try {
      _leetCodeRating = json
          .jsonDecode(content)['data']['userContestRanking']['rating']
          .toString();
    } catch (e) {
      debugPrint('Error: $e');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getLeetCodeRank();
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
      CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Image.asset('logos/C++.png')),
      CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Image.asset('logos/dart.png')),
      CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Image.asset('logos/flask.png')),
      CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Image.asset('logos/flutter.png')),
      CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Image.asset('logos/python.png')),
      CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Image.asset('logos/SFML.png')),
    ];

    return PageBox(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Design.getMatirialWidth(context) / 6,
          Design.getMatirialHeight(context) / 4,
          Design.getMatirialWidth(context) / 6,
          0,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child: AboutMeList(contents: contents),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: LogoBox(icons: icons),
            )
          ],
        ),
      ),
    );
  }
}
