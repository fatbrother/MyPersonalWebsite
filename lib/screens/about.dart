import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
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
  List<String> files = [];

  Future<void> getLogoFiles() async {
    try {
      String dirJsonFile = await rootBundle.loadString('assets/logos/all.json');
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
      '擅長語言: C++, Dart, Python',
      '擅長框架: SFML, Flutter, Flask',
    ];

    List<CircleAvatar> icons = [
      for (String dir in files)
        CircleAvatar(
            radius: Design.getMatirialWidth(context) * 0.03,
            backgroundColor: Colors.transparent,
            child: Image.asset(dir)),
    ];

    return PageBox(
      backgroundColor: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(0),
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
