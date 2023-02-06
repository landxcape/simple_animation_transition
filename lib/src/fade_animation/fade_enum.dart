enum FadeType {
  fadeIn,
  fadeOut,
}

extension FadeTypeExtension on FadeType {
  double getBegin() {
    switch (this) {
      case FadeType.fadeIn:
        return 0.0;
      case FadeType.fadeOut:
        return 1.0;
    }
  }

  double getEnd() {
    switch (this) {
      case FadeType.fadeIn:
        return 1.0;
      case FadeType.fadeOut:
        return 0.0;
    }
  }
}
