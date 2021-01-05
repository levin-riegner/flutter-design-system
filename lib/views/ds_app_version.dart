import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:package_info/package_info.dart';

class DSAppVersion extends StatelessWidget {
  final TextStyle _textStyle;

  DSAppVersion({
    TextStyle textStyle,
  }) : _textStyle = textStyle ??
            ThemeProvider.theme.textStyles.overline
                .copyWith(color: ThemeProvider.theme.colors.disabled);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, data) {
        if (!data.hasData) return Container();
        final info = data.data;
        return Text(
          "${info.version} (${info.buildNumber})",
          style: _textStyle,
        );
      },
    );
  }
}
