import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/platform_aware_widget.dart';

class DSRefreshIndicator
    extends PlatformAwareWidget<CustomScrollView, CustomScrollView> {
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
  CustomScrollView buildAndroidWidget(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        if (sliverAppBar != null) sliverAppBar,
        SliverToBoxAdapter(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: child,
          ),
        ),
      ],
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
