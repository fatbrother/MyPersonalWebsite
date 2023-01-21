import 'package:flutter/material.dart';
import 'package:my_personal_website/screens/about.dart';
import 'package:my_personal_website/screens/bottom.dart';
import 'package:my_personal_website/screens/home.dart';
import 'package:my_personal_website/screens/works.dart';
import 'package:my_personal_website/widgets/app_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ItemScrollController _itemScrollController = ItemScrollController();

  final List<Widget> _buildPages = [
    const HomePage(),
    const AboutPage(),
    const WorksPage(),
    const ButtomBar(),
  ];

  void goto(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(onPressed: goto),
      body: ScrollablePositionedList.builder(
        itemCount: _buildPages.length,
        itemBuilder: (context, index) => _buildPages[index],
        itemScrollController: _itemScrollController,
      ),
    );
  }
}
