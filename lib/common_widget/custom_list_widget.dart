import '../project_setup.dart';

class ListWidget extends StatelessWidget {
  final bool separator;
  final bool shrinkWrap;
  final int itemCount;
  final ScrollPhysics? scrollPhysics;
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollController? scrollController;
  final bool? reverse;
  final Axis? scrollDirection;
  final EdgeInsets? padding;

  const ListWidget({
    super.key,
    this.separator = false,
    this.shrinkWrap = true,
    this.itemCount = 0,
    this.scrollPhysics,
    this.scrollDirection,
    required this.itemBuilder,
    this.scrollController,
    this.reverse,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return separator==false?
    ListView.builder(
      controller: scrollController,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      physics: scrollPhysics??AlwaysScrollableScrollPhysics(),
      scrollDirection: scrollDirection??Axis.vertical,
      itemBuilder: itemBuilder,
      padding: padding??EdgeInsets.zero,
      reverse: reverse??false,
    ):ListView.separated(
        controller: scrollController,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        physics: scrollPhysics??AlwaysScrollableScrollPhysics(),
        scrollDirection: scrollDirection??Axis.vertical,
        itemBuilder: itemBuilder,
        padding: padding??EdgeInsets.zero,
        reverse: reverse??false,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0.2,
            color: ColorResource.borderColor,
          );
        }
    );
  }
}