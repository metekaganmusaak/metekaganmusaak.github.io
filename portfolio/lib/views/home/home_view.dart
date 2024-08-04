import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/extensions/padding_extension.dart';
import 'package:portfolio/responsive_widget.dart';
import 'package:portfolio/services/core/theme_service.dart';
import 'package:portfolio/views/home/widgets/custom_card_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:html' as html;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'.toUpperCase()),
        actions: [
          TextButton(
            onPressed: () {
              context.go('/apps');
            },
            child: Text('My Apps'.toUpperCase()),
          ),
          // TextButton(
          //   onPressed: () {
          //     context.go('/blogs');
          //   },
          //   child: Text('Blogs'.toUpperCase()),
          // ),
          // TextButton(
          //   onPressed: () {
          //     context.go('/about-me');
          //   },
          //   child: Text('About Me'.toUpperCase()),
          // ),
        ],
      ),
      body: const ResponsiveWidget(
        largeScreen: _LargeHomeView(),
        mediumScreen: _MediumHomeView(),
        smallScreen: _SmallHomeView(),
      ),
    );
  }
}

class _LargeHomeView extends StatelessWidget {
  const _LargeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.largeScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Mete Kağan MUSAAK\n',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                TextSpan(
                  text: 'Mobile Application Developer',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpeg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'About Me',
            description: Text.rich(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
              const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'I am a person who strives to perceive that which I cannot see through what I can see. Therefore, I have a profound passion for ',
                  ),
                  TextSpan(
                    text: 'science',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'technology.\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'I believe that working for the',
                  ),
                  TextSpan(
                    text: ' benefit of humanity ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                      text:
                          'is the most crucial aspect of being human, and I develop applications that serve this purpose.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'Socials & Contact Me',
            description: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    final canLaunch = await canLaunchUrlString(
                        'https://github.com/metekaganmusaak');

                    if (canLaunch) {
                      await launchUrlString(
                          'https://github.com/metekaganmusaak');
                    }
                  },
                  label: const Text('Github'),
                  icon: const FaIcon(FontAwesomeIcons.github),
                ),
                TextButton.icon(
                  onPressed: () async {
                    const url = 'https://www.linkedin.com/in/metekaganmusaak';
                    final canLaunch = await canLaunchUrlString(url);

                    if (canLaunch) {
                      await launchUrlString(url);
                    }
                  },
                  label: const Text('Linkedin'),
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                ),
                TextButton.icon(
                  onPressed: () async {
                    const url = 'mailto:metekaganmusaak@gmail.com';
                    final canLaunch = await canLaunchUrlString(url);

                    if (canLaunch) {
                      await launchUrlString(url);
                    }
                  },
                  label: const Text('Gmail'),
                  icon: const FaIcon(Icons.email),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'See My CV',
            description: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    const pdfUrl =
                        'https://drive.google.com/file/d/18TwFj3H1wP9oTDxYlw7bnKXKXBTPELqC/view?usp=sharing';

                    // PDF dosyasını yeni bir sekmede açmak için bir anchor (link) elemanı oluşturun
                    final anchor = html.AnchorElement(href: pdfUrl)
                      ..setAttribute('target', '_blank');

                    anchor.click();
                  },
                  label: const Text('Look at CV'),
                  icon: const Icon(FontAwesomeIcons.filePdf),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MediumHomeView extends StatelessWidget {
  const _MediumHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.mediumScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Mete Kağan MUSAAK\n',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                TextSpan(
                  text: 'Mobile Application Developer',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpeg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'About Me',
            description: Text.rich(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
              const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'I am a person who strives to perceive that which I cannot see through what I can see. Therefore, I have a profound passion for ',
                  ),
                  TextSpan(
                    text: 'science',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'technology.\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'I believe that working for the',
                  ),
                  TextSpan(
                    text: ' benefit of humanity ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                      text:
                          'is the most crucial aspect of being human, and I develop applications that serve this purpose.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'Socials & Contact Me',
            description: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    final canLaunch = await canLaunchUrlString(
                        'https://github.com/metekaganmusaak');

                    if (canLaunch) {
                      await launchUrlString(
                          'https://github.com/metekaganmusaak');
                    }
                  },
                  label: const Text('Github'),
                  icon: const FaIcon(FontAwesomeIcons.github),
                ),
                TextButton.icon(
                  onPressed: () async {
                    const url = 'https://www.linkedin.com/in/metekaganmusaak';
                    final canLaunch = await canLaunchUrlString(url);

                    if (canLaunch) {
                      await launchUrlString(url);
                    }
                  },
                  label: const Text('Linkedin'),
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                ),
                TextButton.icon(
                  onPressed: () async {
                    const url = 'mailto:metekaganmusaak@gmail.com';
                    final canLaunch = await canLaunchUrlString(url);

                    if (canLaunch) {
                      await launchUrlString(url);
                    }
                  },
                  label: const Text('Gmail'),
                  icon: const FaIcon(Icons.email),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'See My CV',
            description: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    const pdfUrl =
                        'https://drive.google.com/file/d/18TwFj3H1wP9oTDxYlw7bnKXKXBTPELqC/view?usp=sharing';

                    // PDF dosyasını yeni bir sekmede açmak için bir anchor (link) elemanı oluşturun
                    html.AnchorElement(href: pdfUrl)
                      ..setAttribute('target', '_blank')
                      ..click();
                  },
                  label: const Text('Look at CV'),
                  icon: const Icon(FontAwesomeIcons.filePdf),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallHomeView extends StatelessWidget {
  const _SmallHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.smallScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Mete Kağan MUSAAK\n',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                TextSpan(
                  text: 'Mobile Application Developer',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpeg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'About Me',
            description: Text.rich(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
              const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'I am a person who strives to perceive that which I cannot see through what I can see. Therefore, I have a profound passion for ',
                  ),
                  TextSpan(
                    text: 'science',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'technology.\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'I believe that working for the',
                  ),
                  TextSpan(
                    text: ' benefit of humanity ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.primary,
                    ),
                  ),
                  TextSpan(
                      text:
                          'is the most crucial aspect of being human, and I develop applications that serve this purpose.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'Socials & Contact Me',
            description: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    final canLaunch = await canLaunchUrlString(
                        'https://github.com/metekaganmusaak');

                    if (canLaunch) {
                      await launchUrlString(
                          'https://github.com/metekaganmusaak');
                    }
                  },
                  label: const Text('Github'),
                  icon: const FaIcon(FontAwesomeIcons.github),
                ),
                TextButton.icon(
                  onPressed: () async {
                    const url = 'https://www.linkedin.com/in/metekaganmusaak';
                    final canLaunch = await canLaunchUrlString(url);

                    if (canLaunch) {
                      await launchUrlString(url);
                    }
                  },
                  label: const Text('Linkedin'),
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                ),
                TextButton.icon(
                  onPressed: () async {
                    const url = 'mailto:metekaganmusaak@gmail.com';
                    final canLaunch = await canLaunchUrlString(url);

                    if (canLaunch) {
                      await launchUrlString(url);
                    }
                  },
                  label: const Text('Gmail'),
                  icon: const FaIcon(Icons.email),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          CustomCardWidget(
            title: 'See My CV',
            description: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    const pdfUrl =
                        'https://drive.google.com/file/d/18TwFj3H1wP9oTDxYlw7bnKXKXBTPELqC/view?usp=sharing';

                    // PDF dosyasını yeni bir sekmede açmak için bir anchor (link) elemanı oluşturun
                    html.AnchorElement(href: pdfUrl)
                      ..setAttribute('target', '_blank')
                      ..click();
                  },
                  label: const Text('Look at CV'),
                  icon: const Icon(FontAwesomeIcons.filePdf),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
