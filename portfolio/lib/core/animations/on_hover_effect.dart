import 'package:flutter/material.dart';

class OnHoverEffect extends StatefulWidget {
  const OnHoverEffect({super.key, required this.builder});

  final Widget Function(bool) builder;

  @override
  State<OnHoverEffect> createState() => _OnHoverEffectState();
}

class _OnHoverEffectState extends State<OnHoverEffect> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: widget.builder(isHovering),
    );
  }
}
