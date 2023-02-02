import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class PageBox extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const PageBox({
    super.key,
    required this.child,
    required this.padding,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: Design.getMatirialHeight(context) - Design.appBarHeight,
      width: Design.getMatirialWidth(context),
      color: backgroundColor,
      child: child,
    );
  }
}
