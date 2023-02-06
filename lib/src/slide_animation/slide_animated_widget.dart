import 'package:flutter/material.dart';
import 'package:simple_animation_transition/src/slide_animation/slide_direction_enum.dart';

class SlideAnimatedWidget extends StatefulWidget {
  const SlideAnimatedWidget({
    super.key,
    this.direction = SlideDirectionType.fromLeft,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.fastOutSlowIn,
    this.heightFrom,
    this.widthFrom,
    required this.child,
  }) : assert(
          direction != SlideDirectionType.fromPosition || (heightFrom != null && widthFrom != null),
          "heightFrom and widthFrom should be not null when direction is $direction",
        );

  final SlideDirectionType direction;
  final Duration duration;
  final Curve curve;
  final Widget child;
  final double? heightFrom;
  final double? widthFrom;

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
      begin: widget.direction.getBegin(
        widget.heightFrom ?? 20.0,
        widget.widthFrom ?? 20.0,
      ),
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
