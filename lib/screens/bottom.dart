// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  onPressed: () {
                    String userId = "劉又瑄#8450";
                    Clipboard.setData(ClipboardData(text: userId));
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(10),
                            content: const Text("User ID copied to clipboard"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              )
                            ],
                          );
                        });
                  },
                  iconSize: 40,
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset("assets/icons/Discord.png"),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    String userUrl = "https://www.instagram.com/maybeiamafrog/";
                    js.context.callMethod("open", [userUrl]);
                  },
                  iconSize: 40,
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset("assets/icons/Instagram.png"),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    String userUrl = "https://www.facebook.com/profile.php?id=100007226413243";
                    js.context.callMethod("open", [userUrl]);
                  },
                  iconSize: 40,
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset("assets/icons/Facebook.png"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
