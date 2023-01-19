import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';
import 'package:my_personal_website/widgets/page_box.dart';
import 'package:my_personal_website/widgets/welcome_quote.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageBox(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Design.getMatirialWidth(context) / 6,
          Design.getMatirialHeight(context) / 3.5,
          Design.getMatirialWidth(context) / 6,
          0,
        ),
        child: Stack(
          children: const [
            Positioned(
              top: 0.0,
              left: 0.0,
              child: WelcomeQuote(),
            ),
          ],
        ),
      ),
    );
  }
}
