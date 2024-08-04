import 'package:flutter/material.dart';

class Palette {
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color lightBlack = Color.fromARGB(255, 14, 14, 14);

  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color transparent = Color.fromARGB(0, 0, 0, 0);

  static const Color primary = Color.fromARGB(255, 120, 34, 174);
  static const Color primaryLight = Color.fromARGB(122, 183, 123, 209);
}

class ThemeService {
  static get theme => ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Palette.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.lightBlack,
          foregroundColor: Palette.white,
          scrolledUnderElevation: 0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Palette.white),
            padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
            visualDensity: VisualDensity.compact,
            side: WidgetStateBorderSide.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return BorderSide.none;
              }

              if (states.contains(WidgetState.hovered)) {
                return const BorderSide(
                  color: Palette.primary,
                  width: 2,
                );
              }

              return BorderSide.none;
            }),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return Palette.transparent;
              }

              if (states.contains(WidgetState.hovered)) {
                return Palette.primaryLight;
              }

              return Palette.transparent;
            }),
            animationDuration: const Duration(milliseconds: 500),
            mouseCursor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return SystemMouseCursors.forbidden;
              }

              if (states.contains(WidgetState.hovered)) {
                return SystemMouseCursors.click;
              }

              return SystemMouseCursors.basic;
            }),
            shape: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    color: Palette.white,
                    width: 2,
                  ),
                );
              }

              if (states.contains(WidgetState.hovered)) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    color: Palette.primary,
                    width: 2,
                  ),
                );
              }

              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: Palette.transparent,
                  width: 2,
                ),
              );
            }),
          ),
        ),
        cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          elevation: 16,
          color: Palette.lightBlack,
        ),
      );
}
