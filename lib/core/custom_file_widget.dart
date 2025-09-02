import '../project_setup.dart';

class CustomFileWidget extends StatelessWidget {
  final String? filePath;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final bool loader; // 👈 loader flag
  final double loaderSize;
  final double placeHolderSize;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final Color? placeHolderColor;
  final String? placeHolder;

  const CustomFileWidget({
    super.key,
    this.filePath,
    this.fit,
    this.height,
    this.width,
    this.loader = false,
    this.loaderSize = 30,
    this.placeHolderSize = 40,
    this.radius,
    this.borderRadius,
    this.placeHolderColor,
    this.placeHolder,
  });

  /// 🔄 Reusable fallback
  Widget _buildFallback(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width / 2.2,
        height: height ?? MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          border: Border.all(
            color: placeHolderColor ?? Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Center(
          child: CustomSvgWidget(
            assetName: placeHolder ?? ImageResource.logo,
            height: placeHolderSize,
            width: placeHolderSize,
            fit: fit ?? BoxFit.contain,
            color: placeHolderColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final file = filePath != null ? File(filePath!) : null;

    if (file == null || !file.existsSync()) {
      return _buildFallback(context);
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width / 2.2,
        height: height ?? MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: loader
            ? Center(
          child: SizedBox(
            width: loaderSize,
            height: loaderSize,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
        )
            : Image.file(
          file,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
