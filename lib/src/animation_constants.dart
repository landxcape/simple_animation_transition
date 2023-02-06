import 'package:flutter/animation.dart';

import 'package:simple_animation_transition/simple_animation_transition.dart';

/// default values for animations
class AnimationConstants {
  static const defaultDuration = Duration(milliseconds: 1500);
  static const defaultCurve = Curves.fastOutSlowIn;
  static const defaultFade = FadeType.fadeIn;
  static const defaultScale = ScaleType.scaleIn;
  static const defaultSlide = SlideDirectionType.fromLeft;
  static const defaultSlideHeight = 20.0;
  static const defaultSlideWidth = 20.0;
}
