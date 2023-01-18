import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _leetCodeRating = '';

  Future<void> getLeetCodeRank() async {
    String url =
        'https://leetcode.com/graphql?query=query{userContestRanking(username:"kevin92422") {rating}}';
    String content = '';
    try {
      var result = await http.get(Uri.parse(url));
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
    return Container(
      height: Design.getMatirialHeight(context) - Design.appBarHeight,
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Design.getMatirialHeight(context) / 4,
          Design.getMatirialHeight(context) / 4,
          Design.getMatirialHeight(context) / 4,
          0,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child: SizedBox(
                width: Design.getMatirialWidth(context) * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 2.0,
                      width: Design.getMatirialWidth(context) * 0.3,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    for (var content in contents)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          content,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
