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
      padding: EdgeInsets.fromLTRB(
        Design.getMatirialWidth(context) * 0.1,
        Design.getMatirialHeight(context) * 0.1,
        Design.getMatirialWidth(context) * 0.1,
        0,
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment(-1, 0),
            child: WelcomeQuote(),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset(
              'assets/images/selfie.png',
              width: Design.getMatirialWidth(context) * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
