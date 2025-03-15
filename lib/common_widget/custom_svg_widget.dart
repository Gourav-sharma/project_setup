import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgWidget extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const CustomSvgWidget({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      colorBlendMode: BlendMode.srcIn,
      color: color,
      allowDrawingOutsideViewBox: true,
    );
  }
}