// widget_marquee.dart
import 'package:flutter/material.dart';

class WidgetMarquee extends StatefulWidget {
  final Widget child;
  final double velocity;

  const WidgetMarquee({super.key, required this.child, this.velocity = 50});

  @override
  State<WidgetMarquee> createState() => _WidgetMarqueeState();
}

class _WidgetMarqueeState extends State<WidgetMarquee>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: (1000 ~/ widget.velocity)),
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant WidgetMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.velocity != widget.velocity) {
      _controller.duration = Duration(seconds: (1000 ~/ widget.velocity));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: double.infinity,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final offset = _controller.value * 3000;
              return Transform.translate(
                offset: Offset(-offset, 0),
                child: child,
              );
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}