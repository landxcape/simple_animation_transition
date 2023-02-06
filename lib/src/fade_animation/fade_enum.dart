enum FadeType {
  /// from 0% opacity to 100%
  fadeIn,
  /// from 100% opacity to 0%
  fadeOut,
}

extension FadeTypeExtension on FadeType {
  /// values for start of the tween
  double getBegin() {
    switch (this) {
      case FadeType.fadeIn:
        return 0.0;
      case FadeType.fadeOut:
        return 1.0;
    }
  }

  /// values for end of the tween
  double getEnd() {
    switch (this) {
      case FadeType.fadeIn:
        return 1.0;
      case FadeType.fadeOut:
        return 0.0;
    }
  }
}
