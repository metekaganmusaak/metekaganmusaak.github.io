import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:portfolio/core/extensions/padding_extension.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/responsive_widget.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key, required this.app});

  final AppModel app;

  @override
  State<TermsOfService> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<TermsOfService> {
  String data = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMarkdown();
  }

  Future<void> loadMarkdown() async {
    final byteData = await rootBundle.load(
      widget.app.termsOfService,
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
        title: const Text('Terms of Service'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ResponsiveWidget(
                largeScreen: _LargeTermsOfServiceView(data: data),
                mediumScreen: _MediumTermsOfServiceView(data: data),
                smallScreen: _SmallTermsOfServiceView(data: data),
              ),
      ),
    );
  }
}

class _LargeTermsOfServiceView extends StatelessWidget {
  const _LargeTermsOfServiceView({super.key, required this.data});
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

class _MediumTermsOfServiceView extends StatelessWidget {
  const _MediumTermsOfServiceView({super.key, required this.data});
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

class _SmallTermsOfServiceView extends StatelessWidget {
  const _SmallTermsOfServiceView({super.key, required this.data});
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
