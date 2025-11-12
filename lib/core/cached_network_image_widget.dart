import '../project_setup.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final bool placeLoader; // 👈 loader flag
  final double loaderSize;
  final double placeHolderSize; // 👈 new param
  final bool? border;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? placeHolderColor;
  final Color? borderColor;
  final Widget? placeHolder;

  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.radius,
    this.placeLoader = false,
    this.loaderSize = 30,
    this.placeHolderSize = 40, // default size for SVG/logo
    this.border,
    this.borderRadius,
    this.fit,
    this.placeHolderColor,
    this.borderColor,
    this.placeHolder,
  });

  /// 🔄 Reusable fallback (placeholder/error)
  Widget _buildFallback(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width / 2.2,
        height: height ?? MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          border: border == true
              ? Border.all(color: borderColor?? Colors.black, width: 1)
              : null,
        ),
        child: Center(
          child: placeHolder ?? Icon(Icons.image_outlined,
          size: placeHolderSize,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if url is empty → fallback immediately
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildFallback(context);
    }

    return CachedNetworkImage(
      width: width ?? MediaQuery.of(context).size.width / 2.2,
      height: height ?? MediaQuery.of(context).size.width / 1.8,
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? MediaQuery.of(context).size.width / 2.2,
        height: height ?? MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          border: border == true
              ? Border.all(color: borderColor ?? Colors.black, width: 1)
              : null,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),

      // show loader or fallback
      placeholder: (context, url) => placeLoader
          ? Container(
        width: width ?? MediaQuery.of(context).size.width / 2.2,
        height: height ?? MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          color: Colors.black.withAlpha(30),
          border: border == true
              ? Border.all(color: borderColor?? Colors.black, width: 1)
              : null,
        ),
        child: Center(
          child: SizedBox(
            width: loaderSize,
            height: loaderSize,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      )
          : _buildFallback(context),

      // fallback if 404 / error
      errorWidget: (context, url, error) => _buildFallback(context),
    );
  }
}
