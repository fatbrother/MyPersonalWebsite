import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(int index) onPressed;
  
  const TitleAppBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Row(
          children: [
            TextButton(
              onPressed: () => onPressed(0),
              child: Text('Home', style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(width: 30.0),
            TextButton(
              onPressed: () => onPressed(1),
              child:
                  Text('About', style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(width: 30.0),
            TextButton(
              onPressed: () => onPressed(2),
              child:
                  Text('Works', style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(width: 30.0),
            ElevatedButton(
              onPressed: () => onPressed(3),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                minimumSize: const Size(100.0, 50.0),
              ),
              child: Text('Contact Me',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(width: 40.0),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Design.appBarHeight);
}
