import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ThemeProvider.theme.dimensions.borderSmall))),
        color: ThemeProvider.theme.colors.surface,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(ThemeProvider.theme.dimensions.borderSmall)),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(ThemeProvider.theme.spacing.m),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(ThemeProvider.theme.dimensions.radiusMedium)),
                      child: Container(
                        color: ThemeProvider.theme.colors.secondary,
                        padding: EdgeInsets.only(
                          left: ThemeProvider.theme.spacing.s,
                          top: ThemeProvider.theme.spacing.xxs,
                          right: ThemeProvider.theme.spacing.s,
                          bottom: ThemeProvider.theme.spacing.xxs,
                        ),
                        child: Text(
                          title.toUpperCase(),
                          style: ThemeProvider.theme.textStyles.button.apply(color: ThemeProvider.theme.colors.onSecondary),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ThemeProvider.theme.spacing.l,
                ),
                description != null ? Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeProvider.theme.textStyles.h6.apply(color: ThemeProvider.theme.colors.onSurface),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
