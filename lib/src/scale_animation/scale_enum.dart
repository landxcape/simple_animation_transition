enum ScaleType {
  scaleIn,
  scaleOut,
}

extension ScaleTypeExtension on ScaleType {
  double getBegin() {
    switch (this) {
      case ScaleType.scaleIn:
        return 0.5;
      case ScaleType.scaleOut:
        return 1.0;
    }
  }

  double getEnd() {
    switch (this) {
      case ScaleType.scaleIn:
        return 1.0;
      case ScaleType.scaleOut:
        return 0.5;
    }
  }
}
