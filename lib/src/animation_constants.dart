import 'package:flutter/animation.dart';

import 'fade_animation/fade_enum.dart';
import 'scale_animation/scale_enum.dart';
import 'slide_animation/slide_direction_enum.dart';

class AnimationConstants {
  static const defaultDuration = Duration(milliseconds: 1500);
  static const defaultCurve = Curves.fastOutSlowIn;
  static const defaultFade = FadeType.fadeIn;
  static const defaultScale = ScaleType.scaleIn;
  static const defaultSlide = SlideDirectionType.fromLeft;
}
