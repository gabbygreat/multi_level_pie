import 'dart:math' show pi;

extension NumToRadians on num {
  double toRadians() {
    return toDouble() * (pi / 180.0);
  }

  double toDegree() {
    return toDouble() * (180 / pi);
  }
}
