// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:my_personal_website/modules/repo.dart';
import 'package:my_personal_website/utilities/design.dart';

class RepoBox extends StatelessWidget {
  const RepoBox({
    Key? key,
    required this.repo,
    required this.color,
  }) : super(key: key);

  final Repo repo;
  final Color color;
  static const double width = 320;
  static const double height = 160;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => js.context.callMethod("open", [repo.url]),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),
        constraints: BoxConstraints(
          maxWidth: Design.getMatirialWidth(context) * 0.7,
          maxHeight: Design.getMatirialHeight(context) * 0.2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repo.name ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                Text(repo.description ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: color,
                ),
                const SizedBox(width: 10),
                Text(repo.language ?? '',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
