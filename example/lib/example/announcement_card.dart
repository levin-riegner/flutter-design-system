import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:showcase/example/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final Announcement announcement;

  AnnouncementCard({
    @required this.width,
    @required this.announcement,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ThemeProvider.theme.dimensions.borderSmall))),
        color: ThemeProvider.theme.colors.surface,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(ThemeProvider.theme.dimensions.borderSmall)),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(ThemeProvider.theme.spacing.m),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          announcement.title.toUpperCase(),
                          style: ThemeProvider.theme.typography.button.apply(color: ThemeProvider.theme.colors.onSecondary),
                        ),
                      ),
                    ),
                    announcement.points != 0
                        ? Text(
                            announcement.points == 1 ? "+${announcement.points} Point" : "+${announcement.points} Points",
                            style: ThemeProvider.theme.typography.button.apply(color: ThemeProvider.theme.colors.secondary),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(
                  height: ThemeProvider.theme.spacing.l,
                ),
                Text(
                  announcement.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeProvider.theme.typography.h6.apply(color: ThemeProvider.theme.colors.onSurface),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
