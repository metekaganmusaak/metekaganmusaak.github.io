import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/core/navigation_service.dart';
import 'package:portfolio/services/core/theme_service.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      routerConfig: NavigationService.router,
      theme: ThemeService.theme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    );
  }
}
