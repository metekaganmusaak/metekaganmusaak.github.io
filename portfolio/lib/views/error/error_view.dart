import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/padding_extension.dart';
import 'package:portfolio/responsive_widget.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
        automaticallyImplyLeading: false,
      ),
      body: const ResponsiveWidget(
        largeScreen: _LargeErrorView(),
        mediumScreen: _MediumErrorView(),
        smallScreen: _SmallErrorView(),
      ),
    );
  }
}

class _LargeErrorView extends StatelessWidget {
  const _LargeErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.largeScreenPadding,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/not_found.png',
              height: 500,
            ),
            const SizedBox(height: 16),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MediumErrorView extends StatelessWidget {
  const _MediumErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.mediumScreenPadding,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/not_found.png',
              height: 400,
            ),
            const SizedBox(height: 16),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallErrorView extends StatelessWidget {
  const _SmallErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.smallScreenPadding,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/not_found.png',
              height: 300,
            ),
            const SizedBox(height: 16),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
