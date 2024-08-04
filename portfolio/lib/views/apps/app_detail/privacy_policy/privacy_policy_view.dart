import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:portfolio/core/extensions/padding_extension.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/responsive_widget.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key, required this.app});

  final AppModel app;

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  String data = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMarkdown();
  }

  Future<void> loadMarkdown() async {
    final byteData = await rootBundle.load(
      widget.app.privacyPolicy,
    );

    final content = byteData.buffer.asUint8List();

    setState(() {
      data = utf8.decode(content);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Privacy Policy'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ResponsiveWidget(
                largeScreen: _LargePrivacyPolicyView(data: data),
                mediumScreen: _MediumPrivacyPolicyView(data: data),
                smallScreen: _SmallPrivacyPolicyView(data: data),
              ),
      ),
    );
  }
}

class _LargePrivacyPolicyView extends StatelessWidget {
  const _LargePrivacyPolicyView({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.largeScreenPadding,
      child: MarkdownWidget(
        data: data,
        shrinkWrap: true,
      ),
    );
  }
}

class _MediumPrivacyPolicyView extends StatelessWidget {
  const _MediumPrivacyPolicyView({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.mediumScreenPadding,
      child: MarkdownWidget(
        data: data,
        shrinkWrap: true,
      ),
    );
  }
}

class _SmallPrivacyPolicyView extends StatelessWidget {
  const _SmallPrivacyPolicyView({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.smallScreenPadding,
      child: MarkdownWidget(
        data: data,
        shrinkWrap: true,
      ),
    );
  }
}
