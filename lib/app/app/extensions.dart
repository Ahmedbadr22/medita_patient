import 'package:flutter/cupertino.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullDoubke on double? {
  double orZero() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}

extension NonNullList on List<int>? {
  List<int> orEmpty() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension MSpacer on num {
  /// ph add space in a vertical way according to the prefix number [10.ph]
  SizedBox get ph => SizedBox(height: toDouble(),);
  /// pw add space in a horizontal way according to the prefix number [10.ph]
  SizedBox get pw => SizedBox(width: toDouble(),);
}