import '../project_setup.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final bool? placeLoader;
  final double? loaderSize;
  final bool? border;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final placeHolderColor;
  final String? placeHolder;

  const CachedNetworkImageWidget({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.radius,
    this.placeLoader = false,
    this.loaderSize,
    this.border,
    this.borderRadius,
    this.fit,
    this.placeHolderColor,
    this.placeHolder
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? MediaQuery.of(context).size.width / 2.2,
      height: height ?? MediaQuery.of(context).size.width / 1.8,
      imageUrl: imageUrl ?? "https://picsum.photos/200/300",
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? MediaQuery.of(context).size.width / 2.2,
        height: height ?? MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          border:
              border == true ? Border.all(color: Colors.white, width: 1) : null,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          color: ColorResource.blackColor.withAlpha(40),
          border: Border.all(color: ColorResource.buttonColor, width: .5),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
            child: CustomSvgWidget(
              height: 40.dp,
              width: 40.dp,
              assetName: placeHolder ?? ImageResource.logo,
              fit: BoxFit.scaleDown,
            ),
          )
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          border: Border.all(color: ColorResource.lableColor, width: 1),
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 12),
          child: CustomSvgWidget(
            assetName: placeHolder ?? ImageResource.logo,
            height: height ?? 50.dp,
            width: width ?? 50.dp,
            fit: fit ?? BoxFit.cover,
            color: placeHolderColor,
          ),
        ),
      ),
    );
  }
}
