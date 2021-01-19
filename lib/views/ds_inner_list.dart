import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';

import 'ds_list_header.dart';

class DSInnerList<T> extends StatelessWidget {
  final List<T> items;
  final DSListHeader header;
  final IndexedWidgetBuilder itemBuilder;
  final double height;
  final bool shrinkWrap;
  final EdgeInsetsGeometry listPadding;
  final double spacing;

  const DSInnerList({
    @required this.items,
    this.header,
    @required this.itemBuilder,
    this.height,
    this.shrinkWrap = false,
    @required this.listPadding,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    // Prepare spacing between items
    final spacedItemBuilder = (context, index) {
      return Padding(
        padding: EdgeInsets.only(left: index != 0 ? (spacing ?? Dimens.of(context).marginSmall) : 0),
        child: itemBuilder(context, index),
      );
    };
    // Build Horizontal scrolling list
    final list = height != null
        ? SizedBox(
            height: height,
            child: ListView.builder(
              padding: listPadding,
              scrollDirection: Axis.horizontal,
              itemCount: items?.length ?? 0,
              itemBuilder: spacedItemBuilder,
              shrinkWrap: shrinkWrap,
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: listPadding,
            child: Row(
              children: List<Widget>.generate(items?.length ?? 0, (index) => spacedItemBuilder(context, index)),
            ),
          );

    // Add header, margin and list height
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (header != null)
          Padding(
            padding: EdgeInsets.only(bottom: Dimens.of(context).marginMedium),
            child: header,
          ),
        list,
      ],
    );

    return body;
  }
}
