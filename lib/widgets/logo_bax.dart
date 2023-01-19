import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_personal_website/utilities/design.dart';

class LogoBox extends StatelessWidget {
  const LogoBox({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final List<CircleAvatar> icons;

  List<Point<double>> _positionGenerator(
      double width, double height, int numberOfItems, double itemRadius) {
    Random random = Random();
    List<Point<double>> positions = [];
    for (int i = 0; i < numberOfItems; i++) {
      double x = itemRadius + (random.nextDouble() * (width - itemRadius * 2));
      double y = itemRadius + (random.nextDouble() * (height - itemRadius * 2));
      Point<double> newPosition = Point(x, y);
      while (_isOverlap(newPosition, positions, itemRadius, width, height)) {
        x = itemRadius + (random.nextDouble() * (width - itemRadius * 2));
        y = itemRadius + (random.nextDouble() * (height - itemRadius * 2));
        newPosition = Point<double>(x, y);
      }
      positions.add(newPosition);
    }
    return positions;
  }

  bool _isOverlap(Point<double> newPosition, List<Point<double>> positions,
      double itemRadius, double width, double height) {
    for (Point<double> position in positions) {
      double xDistance = (newPosition.x - position.x).abs();
      double yDistance = (newPosition.y - position.y).abs();
      double distance = sqrt(xDistance * xDistance + yDistance * yDistance);
      if (distance < 2 * itemRadius) {
        return true;
      }
    }
    if (newPosition.x - itemRadius * 2 < 0 ||
        newPosition.x + itemRadius * 2 > width ||
        newPosition.y - itemRadius * 2 < 0 ||
        newPosition.y + itemRadius * 2 > height) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double width = Design.getMatirialWidth(context) * 0.3;
    final double height = Design.getMatirialHeight(context) * 0.5;

    final List<Point<double>> points = _positionGenerator(
      width,
      height,
      icons.length,
      icons[0].radius ?? 0.0,
    );
    return SizedBox(
      width: width,
      height: height,
      child: Stack(children: [
        for (int i = 0; i < icons.length; i++)
          Positioned(
            left: points[i].x,
            top: points[i].y,
            child: icons[i],
          )
      ]),
    );
  }
}
