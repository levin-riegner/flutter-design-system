import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Dimens extends InheritedWidget {
  final DimensData data;

  const Dimens({
    Key key,
    this.data,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Dimens oldWidget) {
    return oldWidget.data != data;
  }

  static DimensData of(BuildContext context) {
    final Dimens dimens = context.dependOnInheritedWidgetOfExactType<Dimens>();
    if (dimens == null) return DimensData.fallback();
    return dimens.data;
  }
}

class DimensData {
  
  // region Margins
  final double marginXxxSmall;
  final double marginXxSmall;
  final double marginXSmall;
  final double marginSmall;
  final double marginMedium;
  final double marginLarge;
  final double marginXLarge;
  final double marginXxLarge;
  final double marginXxxLarge;

   SizedBox get boxXxxSmall => SizedBox(height: marginXxxSmall, width: marginXxxSmall);
   SizedBox get boxXxSmall => SizedBox(height: marginXxSmall, width: marginXxSmall);
   SizedBox get boxXSmall => SizedBox(height: marginXSmall, width: marginXSmall);
   SizedBox get boxSmall => SizedBox(height: marginSmall, width: marginSmall);
   SizedBox get boxMedium => SizedBox(height: marginMedium, width: marginMedium);
   SizedBox get boxLarge => SizedBox(height: marginLarge, width: marginLarge);
   SizedBox get boxXLarge => SizedBox(height: marginXLarge, width: marginXLarge);
   SizedBox get boxXxLarge => SizedBox(height: marginXxLarge, width: marginXxLarge);
   SizedBox get boxXxxLarge => SizedBox(height: marginXxxLarge, width: marginXxxLarge);
  // endregion
  
  final double radiusSmall;
  final double radiusMedium;
  final double radiusLarge;
  final double radiusXLarge;

  final double listItemHeight;
  final double listItemHeightLarge;
  final double listItemHeightXLarge;
  final double dividerHeight;

  final double buttonHeight;
  final double buttonMinWidth;

  final double iconSize;
  final double horizontalProgressHeight;
  final double borderSmall;
  final double navigationBarElevation;

  factory DimensData.fallback() {
    return DimensData(
      marginXxxSmall: 2,
      marginXxSmall: 4,
      marginXSmall: 8,
      marginSmall: 12,
      marginMedium: 16,
      marginLarge: 24,
      marginXLarge: 32,
      marginXxLarge: 48,
      marginXxxLarge: 64,
      radiusSmall: 4,
      radiusMedium: 8,
      radiusLarge: 16,
      radiusXLarge: 24,
      listItemHeight: 48,
      listItemHeightLarge: 72,
      listItemHeightXLarge: 96,
      dividerHeight: 2,
      buttonHeight: 48,
      buttonMinWidth: 88,
      iconSize: 24,
      horizontalProgressHeight: 2,
      borderSmall: 1.5,
      navigationBarElevation: 0,
    );
  }

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const DimensData({
    @required this.marginXxxSmall,
    @required this.marginXxSmall,
    @required this.marginXSmall,
    @required this.marginSmall,
    @required this.marginMedium,
    @required this.marginLarge,
    @required this.marginXLarge,
    @required this.marginXxLarge,
    @required this.marginXxxLarge,
    @required this.radiusSmall,
    @required this.radiusMedium,
    @required this.radiusLarge,
    @required this.radiusXLarge,
    @required this.listItemHeight,
    @required this.listItemHeightLarge,
    @required this.listItemHeightXLarge,
    @required this.dividerHeight,
    @required this.buttonHeight,
    @required this.buttonMinWidth,
    @required this.iconSize,
    @required this.horizontalProgressHeight,
    @required this.borderSmall,
    @required this.navigationBarElevation,
  });

  DimensData copyWith({
    double marginXxxSmall,
    double marginXxSmall,
    double marginXSmall,
    double marginSmall,
    double marginMedium,
    double marginLarge,
    double marginXLarge,
    double marginXxLarge,
    double marginXxxLarge,
    double radiusSmall,
    double radiusMedium,
    double radiusLarge,
    double radiusXLarge,
    double listItemHeight,
    double listItemHeightLarge,
    double listItemHeightXLarge,
    double dividerHeight,
    double buttonHeight,
    double buttonMinWidth,
    double iconSize,
    double horizontalProgressHeight,
    double borderSmall,
    double navigationBarElevation,
  }) {
    if ((marginXxxSmall == null ||
            identical(marginXxxSmall, this.marginXxxSmall)) &&
        (marginXxSmall == null ||
            identical(marginXxSmall, this.marginXxSmall)) &&
        (marginXSmall == null || identical(marginXSmall, this.marginXSmall)) &&
        (marginSmall == null || identical(marginSmall, this.marginSmall)) &&
        (marginMedium == null || identical(marginMedium, this.marginMedium)) &&
        (marginLarge == null || identical(marginLarge, this.marginLarge)) &&
        (marginXLarge == null || identical(marginXLarge, this.marginXLarge)) &&
        (marginXxLarge == null ||
            identical(marginXxLarge, this.marginXxLarge)) &&
        (marginXxxLarge == null ||
            identical(marginXxxLarge, this.marginXxxLarge)) &&
        (radiusSmall == null || identical(radiusSmall, this.radiusSmall)) &&
        (radiusMedium == null || identical(radiusMedium, this.radiusMedium)) &&
        (radiusLarge == null || identical(radiusLarge, this.radiusLarge)) &&
        (radiusXLarge == null || identical(radiusXLarge, this.radiusXLarge)) &&
        (listItemHeight == null ||
            identical(listItemHeight, this.listItemHeight)) &&
        (listItemHeightLarge == null ||
            identical(listItemHeightLarge, this.listItemHeightLarge)) &&
        (listItemHeightXLarge == null ||
            identical(listItemHeightXLarge, this.listItemHeightXLarge)) &&
        (dividerHeight == null ||
            identical(dividerHeight, this.dividerHeight)) &&
        (buttonHeight == null || identical(buttonHeight, this.buttonHeight)) &&
        (buttonMinWidth == null ||
            identical(buttonMinWidth, this.buttonMinWidth)) &&
        (iconSize == null || identical(iconSize, this.iconSize)) &&
        (horizontalProgressHeight == null ||
            identical(
                horizontalProgressHeight, this.horizontalProgressHeight)) &&
        (borderSmall == null || identical(borderSmall, this.borderSmall)) &&
        (navigationBarElevation == null ||
            identical(navigationBarElevation, this.navigationBarElevation))) {
      return this;
    }

    return new DimensData(
      marginXxxSmall: marginXxxSmall ?? this.marginXxxSmall,
      marginXxSmall: marginXxSmall ?? this.marginXxSmall,
      marginXSmall: marginXSmall ?? this.marginXSmall,
      marginSmall: marginSmall ?? this.marginSmall,
      marginMedium: marginMedium ?? this.marginMedium,
      marginLarge: marginLarge ?? this.marginLarge,
      marginXLarge: marginXLarge ?? this.marginXLarge,
      marginXxLarge: marginXxLarge ?? this.marginXxLarge,
      marginXxxLarge: marginXxxLarge ?? this.marginXxxLarge,
      radiusSmall: radiusSmall ?? this.radiusSmall,
      radiusMedium: radiusMedium ?? this.radiusMedium,
      radiusLarge: radiusLarge ?? this.radiusLarge,
      radiusXLarge: radiusXLarge ?? this.radiusXLarge,
      listItemHeight: listItemHeight ?? this.listItemHeight,
      listItemHeightLarge: listItemHeightLarge ?? this.listItemHeightLarge,
      listItemHeightXLarge: listItemHeightXLarge ?? this.listItemHeightXLarge,
      dividerHeight: dividerHeight ?? this.dividerHeight,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      buttonMinWidth: buttonMinWidth ?? this.buttonMinWidth,
      iconSize: iconSize ?? this.iconSize,
      horizontalProgressHeight:
          horizontalProgressHeight ?? this.horizontalProgressHeight,
      borderSmall: borderSmall ?? this.borderSmall,
      navigationBarElevation:
          navigationBarElevation ?? this.navigationBarElevation,
    );
  }

  @override
  String toString() {
    return 'DimensData{marginXxxSmall: $marginXxxSmall, marginXxSmall: $marginXxSmall, marginXSmall: $marginXSmall, marginSmall: $marginSmall, marginMedium: $marginMedium, marginLarge: $marginLarge, marginXLarge: $marginXLarge, marginXxLarge: $marginXxLarge, marginXxxLarge: $marginXxxLarge, radiusSmall: $radiusSmall, radiusMedium: $radiusMedium, radiusLarge: $radiusLarge, radiusXLarge: $radiusXLarge, listItemHeight: $listItemHeight, listItemHeightLarge: $listItemHeightLarge, listItemHeightXLarge: $listItemHeightXLarge, dividerHeight: $dividerHeight, buttonHeight: $buttonHeight, buttonMinWidth: $buttonMinWidth, iconSize: $iconSize, horizontalProgressHeight: $horizontalProgressHeight, borderSmall: $borderSmall, navigationBarElevation: $navigationBarElevation}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DimensData &&
          runtimeType == other.runtimeType &&
          marginXxxSmall == other.marginXxxSmall &&
          marginXxSmall == other.marginXxSmall &&
          marginXSmall == other.marginXSmall &&
          marginSmall == other.marginSmall &&
          marginMedium == other.marginMedium &&
          marginLarge == other.marginLarge &&
          marginXLarge == other.marginXLarge &&
          marginXxLarge == other.marginXxLarge &&
          marginXxxLarge == other.marginXxxLarge &&
          radiusSmall == other.radiusSmall &&
          radiusMedium == other.radiusMedium &&
          radiusLarge == other.radiusLarge &&
          radiusXLarge == other.radiusXLarge &&
          listItemHeight == other.listItemHeight &&
          listItemHeightLarge == other.listItemHeightLarge &&
          listItemHeightXLarge == other.listItemHeightXLarge &&
          dividerHeight == other.dividerHeight &&
          buttonHeight == other.buttonHeight &&
          buttonMinWidth == other.buttonMinWidth &&
          iconSize == other.iconSize &&
          horizontalProgressHeight == other.horizontalProgressHeight &&
          borderSmall == other.borderSmall &&
          navigationBarElevation == other.navigationBarElevation);

  @override
  int get hashCode =>
      marginXxxSmall.hashCode ^
      marginXxSmall.hashCode ^
      marginXSmall.hashCode ^
      marginSmall.hashCode ^
      marginMedium.hashCode ^
      marginLarge.hashCode ^
      marginXLarge.hashCode ^
      marginXxLarge.hashCode ^
      marginXxxLarge.hashCode ^
      radiusSmall.hashCode ^
      radiusMedium.hashCode ^
      radiusLarge.hashCode ^
      radiusXLarge.hashCode ^
      listItemHeight.hashCode ^
      listItemHeightLarge.hashCode ^
      listItemHeightXLarge.hashCode ^
      dividerHeight.hashCode ^
      buttonHeight.hashCode ^
      buttonMinWidth.hashCode ^
      iconSize.hashCode ^
      horizontalProgressHeight.hashCode ^
      borderSmall.hashCode ^
      navigationBarElevation.hashCode;

  factory DimensData.fromMap(Map<String, dynamic> map) {
    return new DimensData(
      marginXxxSmall: map['marginXxxSmall'] as double,
      marginXxSmall: map['marginXxSmall'] as double,
      marginXSmall: map['marginXSmall'] as double,
      marginSmall: map['marginSmall'] as double,
      marginMedium: map['marginMedium'] as double,
      marginLarge: map['marginLarge'] as double,
      marginXLarge: map['marginXLarge'] as double,
      marginXxLarge: map['marginXxLarge'] as double,
      marginXxxLarge: map['marginXxxLarge'] as double,
      radiusSmall: map['radiusSmall'] as double,
      radiusMedium: map['radiusMedium'] as double,
      radiusLarge: map['radiusLarge'] as double,
      radiusXLarge: map['radiusXLarge'] as double,
      listItemHeight: map['listItemHeight'] as double,
      listItemHeightLarge: map['listItemHeightLarge'] as double,
      listItemHeightXLarge: map['listItemHeightXLarge'] as double,
      dividerHeight: map['dividerHeight'] as double,
      buttonHeight: map['buttonHeight'] as double,
      buttonMinWidth: map['buttonMinWidth'] as double,
      iconSize: map['iconSize'] as double,
      horizontalProgressHeight: map['horizontalProgressHeight'] as double,
      borderSmall: map['borderSmall'] as double,
      navigationBarElevation: map['navigationBarElevation'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'marginXxxSmall': this.marginXxxSmall,
      'marginXxSmall': this.marginXxSmall,
      'marginXSmall': this.marginXSmall,
      'marginSmall': this.marginSmall,
      'marginMedium': this.marginMedium,
      'marginLarge': this.marginLarge,
      'marginXLarge': this.marginXLarge,
      'marginXxLarge': this.marginXxLarge,
      'marginXxxLarge': this.marginXxxLarge,
      'radiusSmall': this.radiusSmall,
      'radiusMedium': this.radiusMedium,
      'radiusLarge': this.radiusLarge,
      'radiusXLarge': this.radiusXLarge,
      'listItemHeight': this.listItemHeight,
      'listItemHeightLarge': this.listItemHeightLarge,
      'listItemHeightXLarge': this.listItemHeightXLarge,
      'dividerHeight': this.dividerHeight,
      'buttonHeight': this.buttonHeight,
      'buttonMinWidth': this.buttonMinWidth,
      'iconSize': this.iconSize,
      'horizontalProgressHeight': this.horizontalProgressHeight,
      'borderSmall': this.borderSmall,
      'navigationBarElevation': this.navigationBarElevation,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
