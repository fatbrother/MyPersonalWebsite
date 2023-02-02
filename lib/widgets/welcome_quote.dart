import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class WelcomeQuote extends StatelessWidget {
  const WelcomeQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Design.getMatirialHeight(context) * 0.5,
      width: Design.getMatirialWidth(context) * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hello, I\'m',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(' Kevin Liu!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      )),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            'A junior software developer.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5.0),
          Text(
            'Welcome to my personal website.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
