import 'package:flutter/material.dart';
import './slide_direction_enum.dart';

class SlideAnimatedWidget extends StatefulWidget {
  const SlideAnimatedWidget({
    super.key,
    this.direction = SlideDirectionType.fromLeft,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.fastOutSlowIn,
    this.offset,
    required this.child,
  }) : assert(
          direction != SlideDirectionType.fromOffset || (offset != null),
          "heightFrom and widthFrom should be not null when direction is $direction",
        );

  final SlideDirectionType direction;
  final Duration duration;
  final Curve curve;
  final Offset? offset;
  final Widget child;

  @override
  State<SlideAnimatedWidget> createState() => _SlideAnimatedWidgetState();
}

class _SlideAnimatedWidgetState extends State<SlideAnimatedWidget> with TickerProviderStateMixin {
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: widget.direction.getBegin(widget.offset),
      end: widget.direction.getEnd(),
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: widget.curve,
      ),
    );

    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.reverse();
    _slideController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: _slideAnimation.value,
          child: child,
        );
      },
    );
  }
}
