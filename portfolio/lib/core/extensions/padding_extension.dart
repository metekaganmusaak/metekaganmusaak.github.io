import 'package:flutter/material.dart';

extension PaddingExtension on BuildContext {
  EdgeInsets get largeScreenPadding => EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(this).width * 0.2,
        vertical: 10,
      );
  EdgeInsets get mediumScreenPadding => EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(this).width * 0.1,
        vertical: 10,
      );
  EdgeInsets get smallScreenPadding => EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(this).width * 0.05,
        vertical: 10,
      );
}
