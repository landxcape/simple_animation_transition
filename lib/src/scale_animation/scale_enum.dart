enum ScaleType {
  /// from 50% size to 100%
  scaleIn,

  /// from 150% size to 100%
  scaleOut,
}

extension ScaleTypeExtension on ScaleType {
  /// values for start of the tween
  double getBegin() {
    switch (this) {
      case ScaleType.scaleIn:
        return 0.5;
      case ScaleType.scaleOut:
        return 1.0;
    }
  }

  /// values for end of the tween
  double getEnd() {
    switch (this) {
      case ScaleType.scaleIn:
        return 1.5;
      case ScaleType.scaleOut:
        return 1.0;
    }
  }
}
