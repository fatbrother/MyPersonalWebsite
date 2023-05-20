// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  'contact with me',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => js.context.callMethod("open", ['mailto:kevin92422@gmail.com']),
                  iconSize: 30,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    String userUrl = "https://www.linkedin.com/in/%E5%8F%88%E7%91%84-%E5%8A%89-2b31a4276/";
                    js.context.callMethod("open", [userUrl]);
                  },
                  iconSize: 30,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    String userUrl = "https://www.linkedin.com/in/%E5%8F%88%E7%91%84-%E5%8A%89-2b31a4276/";
                    js.context.callMethod("open", [userUrl]);
                  },
                  iconSize: 30,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    String userUrl =
                        "https://www.facebook.com/profile.php?id=100007226413243";
                    js.context.callMethod("open", [userUrl]);
                  },
                  iconSize: 30,
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void copyText(String s, BuildContext context) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.fromLTRB(
        Design.getMatirialWidth(context) * 0.4,
        10,
        Design.getMatirialWidth(context) * 0.4,
        10,
      ),
      content: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(70, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        child: Center(
          child: Text(
            'Copied to clipboard',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Clipboard.setData(ClipboardData(text: s));
  }
}
