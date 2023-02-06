import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

class SlideAnimatedWidget extends StatefulWidget {
  /// Wrap widget to get a sliding effect.
  ///
  /// [direction] by default is [SlideDirectionType.fromLeft] (as defined in [AnimationConstants]).
  /// [duration] by default is 1 second.
  /// [curve] by default is [Curves.fastOutSlowIn].
  /// [offset] is the starting position of the slide when [direction] is [SlideDirectionType.fromOffset]
  /// else, default offset value [AnimationConstants.defaultSlideOffsetValue] is used
  /// when [direction] is of type [SlideDirectionType.fromOffset], [offset] must be supplied
  const SlideAnimatedWidget({
    super.key,
    this.direction = SlideDirectionType.fromLeft,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.fastOutSlowIn,
    this.offset,
    required this.child,
  }) : assert(
          direction != SlideDirectionType.fromOffset || (offset != null),
          "offset should be not null when direction is $direction",
        );

  final SlideDirectionType direction;
  final Duration duration;
  final Curve curve;
  final Offset? offset;
  final Widget child;

  @override
  State<SlideAnimatedWidget> createState() => _SlideAnimatedWidgetState();
}

class _SlideAnimatedWidgetState extends State<SlideAnimatedWidget>
    with TickerProviderStateMixin {
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
