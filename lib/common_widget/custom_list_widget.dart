import 'package:flutter/material.dart';

class CustomListWidget extends StatelessWidget {
  final bool separator;
  final bool shrinkWrap;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const CustomListWidget({
    super.key,
    this.separator = false,
    this.shrinkWrap = true,
    this.itemCount = 0,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}