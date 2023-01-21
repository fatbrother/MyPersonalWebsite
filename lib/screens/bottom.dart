import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class ButtomBar extends StatelessWidget {
  const ButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: Design.getMatirialWidth(context),
      height: Design.bottomBarHeight,
      padding: EdgeInsets.fromLTRB(
        Design.getMatirialWidth(context) * 0.1,
        0,
        Design.getMatirialWidth(context) * 0.1,
        0,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '@CreateByFatbrother',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  'connect with me',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "icons/Discord.png",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "icons/Facebook.png",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "icons/Instagram.png",
                  height: 40,
                  width: 40,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
