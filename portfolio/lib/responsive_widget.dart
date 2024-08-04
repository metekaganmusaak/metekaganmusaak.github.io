import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  });

  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return largeScreen;
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          child: mediumScreen,
        );
      } else {
        return smallScreen;
      }
    });
  }
}
