// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  final String url = 'https://github.com/fatbrother';
  const SeeMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => js.context.callMethod("open", [url]),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        side: BorderSide(
          width: 2.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Text(
        'See more...',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!,
      ),
    );
  }
}
