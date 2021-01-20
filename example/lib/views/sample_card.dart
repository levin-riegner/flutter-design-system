import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';

class SampleCard extends StatelessWidget {
  final double width;
  final String title;
  final String description;
  final VoidCallback onTap;

  SampleCard({
    @required this.width,
    @required this.title,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimens.of(context).borderSmall))),
        color: Theme.of(context).colorScheme.surface,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.of(context).borderSmall)),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(Dimens.of(context).marginMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(Dimens.of(context).radiusMedium)),
                      child: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        padding: EdgeInsets.only(
                          left: Dimens.of(context).marginSmall,
                          top: Dimens.of(context).marginXxSmall,
                          right: Dimens.of(context).marginSmall,
                          bottom: Dimens.of(context).marginXxSmall,
                        ),
                        child: Text(
                          title.toUpperCase(),
                          style: Theme.of(context).textTheme.button.apply(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.of(context).marginLarge,
                ),
                description != null ? Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6.apply(color: Theme.of(context).colorScheme.onSurface),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
