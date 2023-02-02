import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class AboutMeList extends StatelessWidget {
  const AboutMeList({
    Key? key,
    required this.contents,
  }) : super(key: key);

  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
