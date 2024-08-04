import 'package:flutter/material.dart';
import 'package:portfolio/core/animations/on_hover_effect.dart';
import 'package:portfolio/services/core/theme_service.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return OnHoverEffect(
      builder: (isHovered) {
        return AnimatedContainer(
          duration: kThemeAnimationDuration,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Palette.primary,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              if (isHovered) ...[
                BoxShadow(
                  color: Palette.primary.withOpacity(0.5),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ],
          ),
          child: Column(
            children: [
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Divider(),
              description,
            ],
          ),
        );
      },
    );
  }
}
