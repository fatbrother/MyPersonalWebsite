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
        Design.getMatirialWidth(context) * 0.07,
        Design.getMatirialHeight(context) * 0.07,
        Design.getMatirialWidth(context) * 0.07,
        0,
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment(-1, 0),
            child: WelcomeQuote(
                '我是一名熱愛軟體開發和資訊科技的學生，目前就讀於北大資工系。我對於軟體工程師的角色充滿興趣並致力於成為一名優秀的軟體工程師。'),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset(
              'assets/images/selfie.png',
              width: Design.getMatirialWidth(context) * 0.45,
            ),
          ),
        ],
      ),
    );
  }
}
