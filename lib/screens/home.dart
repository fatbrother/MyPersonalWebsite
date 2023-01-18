import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Design.getMatirialHeight(context) - Design.appBarHeight,
      width: Design.getMatirialWidth(context),
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Design.getMatirialHeight(context) / 3.5,
          Design.getMatirialHeight(context) / 3.5,
          Design.getMatirialHeight(context) / 3.5,
          0,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              child: SizedBox(
                height: Design.getMatirialHeight(context) - Design.appBarHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hello, I\'m',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(' Kevin',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
