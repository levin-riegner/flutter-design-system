import 'dart:math' as math show sin, pi;
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:lr_design_system/theme/theme.dart';

class DSLoadingIndicator extends StatefulWidget {
  DSLoadingIndicator({
    Key key,
    Color color,
    this.size = 15.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1000),
    this.controller,
  })  : this.color = color ?? ThemeProvider.theme.colors.primary,
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _DSLoadingIndicatorState createState() => _DSLoadingIndicatorState();
}

class _DSLoadingIndicatorState extends State<DSLoadingIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(widget.size * 2, widget.size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (i) {
          return ScaleTransition(
            scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2)
                .animate(_controller),
            child: SizedBox.fromSize(
                size: Size.square(widget.size * 0.5), child: _itemBuilder(i)),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class DelayTween extends Tween<double> {
  DelayTween({double begin, double end, this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
