import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/extensions/padding_extension.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/responsive_widget.dart';
import 'package:portfolio/views/home/widgets/custom_card_widget.dart';

class AppDetailView extends StatelessWidget {
  const AppDetailView({super.key, required this.app});

  final AppModel app;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(app.title),
        actions: [
          TextButton.icon(
            onPressed: () {
              context.go('/apps/${app.title.toLowerCase()}/privacy-policy');
            },
            label: const Text('Privacy Policy'),
            icon: const Icon(Icons.policy_rounded),
          ),
          TextButton.icon(
            onPressed: () {
              context.go('/apps/${app.title.toLowerCase()}/terms-of-service');
            },
            label: const Text('Terms of Service'),
            icon: const Icon(Icons.article_rounded),
          )
        ],
      ),
      body: ResponsiveWidget(
        largeScreen: _LargeAppDetailView(app: app),
        mediumScreen: _MediumAppDetailView(app: app),
        smallScreen: _SmallAppDetailView(app: app),
      ),
    );
  }
}

class _LargeAppDetailView extends StatelessWidget {
  const _LargeAppDetailView({super.key, required this.app});

  final AppModel app;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SingleChildScrollView(
      padding: context.largeScreenPadding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  app.image,
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      app.longDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        context.go(app.playStoreURL);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/get_it_on_google_play.png',
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          // Screenshots of the app
          CustomCardWidget(
            title: 'Screenshots',
            description: SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      child: Scrollbar(
                        controller: scrollController,
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 24),
                          itemCount: app.screenshots.length,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final image = app.screenshots[index];
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Image.asset(image),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.contain,
                                  ),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediumAppDetailView extends StatelessWidget {
  const _MediumAppDetailView({super.key, required this.app});
  final AppModel app;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SingleChildScrollView(
      padding: context.mediumScreenPadding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  app.image,
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      app.longDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        context.go(app.playStoreURL);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/get_it_on_google_play.png',
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          // Screenshots of the app
          CustomCardWidget(
            title: 'Screenshots',
            description: SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      child: Scrollbar(
                        controller: scrollController,
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 24),
                          itemCount: app.screenshots.length,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final image = app.screenshots[index];
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Image.asset(image),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.contain,
                                  ),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallAppDetailView extends StatelessWidget {
  const _SmallAppDetailView({super.key, required this.app});
  final AppModel app;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SingleChildScrollView(
      padding: context.smallScreenPadding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  app.image,
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      app.longDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        context.go(app.playStoreURL);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/get_it_on_google_play.png',
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          // Screenshots of the app
          CustomCardWidget(
            title: 'Screenshots',
            description: SizedBox(
              height: 300,
              child: Row(
                children: [
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.trackpad,
                        },
                      ),
                      child: Scrollbar(
                        controller: scrollController,
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 24),
                          itemCount: app.screenshots.length,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final image = app.screenshots[index];
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Image.asset(image),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.contain,
                                  ),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
