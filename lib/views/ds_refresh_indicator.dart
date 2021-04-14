import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/platform_aware_widget.dart';

@Deprecated("Not usable until Material RefreshIndicator can be used with slivers")
class DSRefreshIndicator
    extends PlatformAwareWidget<CustomScrollView, RefreshIndicator> {
  final Future<void> Function() onRefresh;
  final Widget child;
  final Widget sliverAppBar;
  final ScrollController controller;

  DSRefreshIndicator({
    @required this.onRefresh,
    @required this.child,
    this.controller,
    this.sliverAppBar,
  });

  @override
  RefreshIndicator buildAndroidWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        controller: controller,
        slivers: [
          if (sliverAppBar != null) sliverAppBar,
          SliverToBoxAdapter(child: child),
        ],
      ),
    );
  }

  @override
  CustomScrollView buildIosWidget(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        if (sliverAppBar != null) sliverAppBar,
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverToBoxAdapter(child: child),
      ],
    );
  }
}
