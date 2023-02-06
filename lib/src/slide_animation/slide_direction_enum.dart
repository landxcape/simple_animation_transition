import 'package:flutter/material.dart';

enum SlideDirectionType {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
  fromOffset,
}

extension DirectionTypeExtension on SlideDirectionType {
  Offset getBegin(Offset? offset) {
    const offsetVal = 25.0;
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
