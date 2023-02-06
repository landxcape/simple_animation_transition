import 'package:flutter/material.dart';

enum SlideDirectionType {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
  fromPosition,
}

extension DirectionTypeExtension on SlideDirectionType {
  Offset getBegin(double heightFrom, double widhtFrom) {
    switch (this) {
      case SlideDirectionType.fromLeft:
        return Offset(-widhtFrom, 0);
      case SlideDirectionType.fromRight:
        return Offset(widhtFrom, 0);
      case SlideDirectionType.fromTop:
        return Offset(0, -heightFrom);
      case SlideDirectionType.fromBottom:
        return Offset(0, heightFrom);
      case SlideDirectionType.fromPosition:
        return Offset(widhtFrom, heightFrom);
    }
  }

  Offset getEnd() {
    switch (this) {
      case SlideDirectionType.fromLeft:
      case SlideDirectionType.fromRight:
      case SlideDirectionType.fromTop:
      case SlideDirectionType.fromBottom:
      case SlideDirectionType.fromPosition:
      default:
        return const Offset(0, 0);
    }
  }
}
