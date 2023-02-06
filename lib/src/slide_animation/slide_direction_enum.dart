import 'package:flutter/material.dart';
import 'package:simple_animation_transition/src/animation_constants.dart';

enum SlideDirectionType {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
  fromOffset,
}

extension DirectionTypeExtension on SlideDirectionType {
  /// values for start of the tween
  Offset getBegin(Offset? offset) {
    const offsetVal = AnimationConstants.defaultSlideOffsetValue;
    switch (this) {
      case SlideDirectionType.fromLeft:
        return const Offset(-offsetVal, 0);
      case SlideDirectionType.fromRight:
        return const Offset(offsetVal, 0);
      case SlideDirectionType.fromTop:
        return const Offset(0, -offsetVal);
      case SlideDirectionType.fromBottom:
        return const Offset(0, offsetVal);
      case SlideDirectionType.fromOffset:
      default:
        return offset ?? const Offset(0, 0);
    }
  }

  /// values for end of the tween
  Offset getEnd() {
    switch (this) {
      case SlideDirectionType.fromLeft:
      case SlideDirectionType.fromRight:
      case SlideDirectionType.fromTop:
      case SlideDirectionType.fromBottom:
      case SlideDirectionType.fromOffset:
      default:
        return const Offset(0, 0);
    }
  }
}
