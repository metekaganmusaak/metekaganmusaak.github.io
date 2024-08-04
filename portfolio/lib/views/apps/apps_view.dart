import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/animations/on_hover_effect.dart';
import 'package:portfolio/core/extensions/padding_extension.dart';
import 'package:portfolio/responsive_widget.dart';
import 'package:portfolio/services/core/theme_service.dart';

final apps = [
  {
    'title': 'Evraka',
    'description': 'Search various type of files with ease.',
    'image': 'assets/images/evraka_app_icon.png',
  },
  {
    'title': 'sodoit - memo',
    'description': 'To-do list app with extra features.',
    'image': 'assets/images/sodoit_app_icon.png',
  },
];

class AppsView extends StatelessWidget {
  const AppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
      ),
      body: const ResponsiveWidget(
        largeScreen: _LargeAppsView(),
        mediumScreen: _MediumAppsView(),
        smallScreen: _SmallAppsView(),
      ),
    );
  }
}

class _LargeAppsView extends StatelessWidget {
  const _LargeAppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.1,
        vertical: 40,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      shrinkWrap: true,
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final app = apps[index];
        return OnHoverEffect(
          builder: (isHovered) {
            return InkWell(
              mouseCursor: isHovered
                  ? WidgetStateMouseCursor.clickable
                  : SystemMouseCursors.basic,
              onTap: () {
                context.go('/apps/${app['title']!.toLowerCase()}');
              },
              child: AnimatedContainer(
                duration: kThemeAnimationDuration,
                decoration: BoxDecoration(
                  color: isHovered
                      ? Palette.primary
                      : Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                curve: Curves.easeInOut,
                padding: isHovered
                    ? const EdgeInsets.all(12)
                    : const EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              app['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          app['title']!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          app['description']!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _MediumAppsView extends StatelessWidget {
  const _MediumAppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: context.mediumScreenPadding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      shrinkWrap: true,
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final app = apps[index];
        return OnHoverEffect(
          builder: (isHovered) {
            return InkWell(
              mouseCursor: isHovered
                  ? WidgetStateMouseCursor.clickable
                  : SystemMouseCursors.basic,
              onTap: () {
                context.go('/apps/${app['title']!.toLowerCase()}');
              },
              child: AnimatedContainer(
                duration: kThemeAnimationDuration,
                decoration: BoxDecoration(
                  color: isHovered
                      ? Palette.primary
                      : Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                curve: Curves.easeInOut,
                padding: isHovered
                    ? const EdgeInsets.all(12)
                    : const EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              app['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          app['title']!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          app['description']!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _SmallAppsView extends StatelessWidget {
  const _SmallAppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: context.smallScreenPadding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: apps.length,
      itemBuilder: (BuildContext context, int index) {
        final app = apps[index];
        return SizedBox(
          height: 400,
          child: OnHoverEffect(
            builder: (isHovered) {
              return InkWell(
                mouseCursor: isHovered
                    ? WidgetStateMouseCursor.clickable
                    : SystemMouseCursors.basic,
                onTap: () {
                  context.go('/apps/${app['title']!.toLowerCase()}');
                },
                child: AnimatedContainer(
                  duration: kThemeAnimationDuration,
                  decoration: BoxDecoration(
                    color: isHovered
                        ? Palette.primary
                        : Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  curve: Curves.easeInOut,
                  padding: isHovered
                      ? const EdgeInsets.all(12)
                      : const EdgeInsets.all(8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                app['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            app['title']!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            app['description']!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
