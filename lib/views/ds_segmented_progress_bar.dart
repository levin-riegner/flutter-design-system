import 'package:lr_design_system/theme/theme.dart';
import 'package:flutter/material.dart';

class DSSegmentedProgressBar extends StatefulWidget {
  /// The current page index ValueNotifier
  final ValueNotifier<int> currentPageNotifier;

  /// PageView completed ValueNotifier
  final ValueNotifier<bool> stepsCompletedNotifier;

  /// The number of items managed by the PageController
  final int itemCount;

  ///The step color
  final Color previousStepColor;
  final Color selectedStepColor;
  final Color nextStepColor;

  ///The step size
  final double size;

  ///The space between steps
  final double stepSpacing;

  ///Whether to pre-fill part the current step or not
  final bool prefillStep;

  DSSegmentedProgressBar({
    Key key,
    @required this.currentPageNotifier,
    @required this.itemCount,
    this.stepsCompletedNotifier,
    double size,
    double stepSpacing,
    double previousStepColor,
    double selectedStepColor,
    double nextStepColor,
    this.prefillStep = false,
  })  : this.size =
            size ?? ThemeProvider.theme.dimensions.horizontalProgressHeight,
        this.stepSpacing = stepSpacing ??
            ThemeProvider.theme.dimensions.horizontalProgressHeight,
        this.previousStepColor =
            previousStepColor ?? ThemeProvider.theme.colors.primary,
        this.selectedStepColor =
            selectedStepColor ?? ThemeProvider.theme.colors.primary,
        this.nextStepColor =
            nextStepColor ?? ThemeProvider.theme.colors.interaction,
        super(key: key);

  @override
  _StepPageIndicatorState createState() {
    return _StepPageIndicatorState();
  }
}

class _StepPageIndicatorState extends State<DSSegmentedProgressBar> {
  int _currentPageIndex = 0;
  bool _stepsCompleted = false;

  @override
  void initState() {
    widget.currentPageNotifier.addListener(_handlePageIndex);
    widget.stepsCompletedNotifier?.addListener(_handleStepsCompleted);
    super.initState();
  }

  @override
  void dispose() {
    widget.currentPageNotifier.removeListener(_handlePageIndex);
    widget.stepsCompletedNotifier?.removeListener(_handleStepsCompleted);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List<Widget>.generate(widget.itemCount * 2, (int index) {
            if (index % 2 == 0) {
              // Build Step
              return Expanded(child: _getStep(index ~/ 2));
            } else {
              // Build Margin
              if (index == (widget.itemCount * 2) - 1)
                return Container(); // Skip last item
              return SizedBox(
                  width: widget.stepSpacing, height: widget.stepSpacing);
            }
          })),
    );
  }

  bool isSelected(int dotIndex) => _currentPageIndex == dotIndex;

  bool isPrevious(int dotIndex) => _currentPageIndex > dotIndex;

  bool isNext(int dotIndex) => _currentPageIndex < dotIndex;

  bool isLast(int dotIndex) => _currentPageIndex == widget.itemCount - 1;

  _handlePageIndex() {
    setState(() => _currentPageIndex = widget.currentPageNotifier.value);
  }

  _handleStepsCompleted() {
    setState(
        () => _stepsCompleted = widget.stepsCompletedNotifier?.value ?? false);
  }

  Widget _getStep(int index) {
    // Last Item and Completed
    if (isLast(index) && _stepsCompleted) {
      return Container(color: widget.previousStepColor);
    }
    // Current Item
    if (isSelected(index)) {
      return Row(
        children: <Widget>[
          if (widget.prefillStep)
            Container(
              width: 5,
              color: widget.selectedStepColor,
            ),
          Expanded(
              child: Container(
            color: widget.nextStepColor,
          ))
        ],
      );
    }
    // Past or Next Item
    return Container(
        color: isPrevious(index)
            ? widget.previousStepColor
            : widget.nextStepColor);
  }
}
