import '../project_setup.dart';

class AssetImageWidget extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const AssetImageWidget({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}