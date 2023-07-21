import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class WelcomeQuote extends StatelessWidget {
  const WelcomeQuote(
    this.quote, {
    Key? key,
  }) : super(key: key);

  final String quote;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Design.getMatirialHeight(context) * 0.5,
      width: Design.getMatirialWidth(context) * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hello  我是',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('劉又瑄!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: Design.getMatirialWidth(context) * 0.3,
            child: Text(
              quote,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.4,
              )
            ),
          )
        ],
      ),
    );
  }
}
