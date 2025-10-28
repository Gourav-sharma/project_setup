import 'package:flutter/material.dart';

import '../project_setup.dart';

/// -------------------------
/// List Widget
/// -------------------------
class CustomListWidget extends StatelessWidget {
  final bool separator;
  final bool shrinkWrap;
  final int itemCount;
  final ScrollPhysics? scrollPhysics;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget? emptyWidget;
  final ScrollController? scrollController;
  final bool? reverse;
  final Axis? scrollDirection;
  final EdgeInsets? padding;
  final bool isLoadingMore; // 👈 new flag
  final Color? dividerColor;
  final Color? iconColor;
  final Color? textColor;

  const CustomListWidget({
    super.key,
    this.separator = false,
    this.shrinkWrap = true,
    this.itemCount = 0,
    this.scrollPhysics,
    this.scrollDirection,
    required this.itemBuilder,
    this.emptyWidget,
    this.scrollController,
    this.reverse,
    this.padding,
    this.isLoadingMore = false, // default false
    this.dividerColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.textColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return emptyWidget ?? EmptyWidget(message: "No data found");
    }

    final totalCount = isLoadingMore ? itemCount + 1 : itemCount;

    return separator == false
        ? ListView.builder(
      controller: scrollController,
      shrinkWrap: shrinkWrap,
      itemCount: totalCount,
      physics: scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: padding ?? EdgeInsets.zero,
      reverse: reverse ?? false,
      itemBuilder: (context, index) {
        if (isLoadingMore && index == itemCount) {
          return const LoaderFooter();
        }
        return itemBuilder(context, index);
      },
    )
        : ListView.separated(
      controller: scrollController,
      shrinkWrap: shrinkWrap,
      itemCount: totalCount,
      physics: scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: padding ?? EdgeInsets.zero,
      reverse: reverse ?? false,
      itemBuilder: (context, index) {
        if (isLoadingMore && index == itemCount) {
          return const LoaderFooter();
        }
        return itemBuilder(context, index);
      },
      separatorBuilder: (context, index) {
        if (isLoadingMore && index == itemCount) {
          return const SizedBox.shrink();
        }
        return Divider(
          height: 0.2,
          color: dividerColor,
        );
      },
    );
  }
}

/// -------------------------
/// Grid Widget (Responsive)
/// -------------------------
class CustomGridWidget extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget? emptyWidget;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int? crossAxisCount;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;
  final bool isLoadingMore; // 👈 new flag

  const CustomGridWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.emptyWidget,
    this.childAspectRatio = 1,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.crossAxisCount,
    this.padding,
    this.scrollController,
    this.scrollPhysics,
    this.shrinkWrap = true,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return emptyWidget ?? EmptyWidget(message: "No data found");
    }

    final grid = GridView.builder(
      controller: scrollController,
      shrinkWrap: shrinkWrap,
      physics: scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
      padding: padding ?? EdgeInsets.zero,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ??
            (MediaQuery.of(context).size.width ~/ 160).clamp(2, 6),
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: itemBuilder,
    );

    return Column(
      children: [
        Expanded(child: grid),
        if (isLoadingMore)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          ),
      ],
    );
  }
}

/// -------------------------
/// Loader Footer Widget
/// -------------------------
class LoaderFooter extends StatelessWidget {
  const LoaderFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

/// -------------------------
/// Empty Widget
/// -------------------------
class EmptyWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final Widget? child;

  const EmptyWidget({
    super.key,
    this.message = "No items available",
    this.icon = Icons.inbox_outlined,
    this.iconColor = Colors.grey,
    this.textColor = Colors.grey,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child ?? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: iconColor),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
