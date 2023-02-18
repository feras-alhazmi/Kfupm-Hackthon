import 'package:flutter/cupertino.dart';

class AxeSpace {
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s6 = 6;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s64 = 64;
}

const kScreenHSpace = AxeSpace.s24;

/// Vertical widget spaces
const kVSpace0 = SizedBox(height: 0, width: 0);
const kVSpace2 = SizedBox(height: 2, width: 0);
const kVSpace4 = SizedBox(height: 4, width: 0);
const kVSpace8 = SizedBox(height: 8, width: 0);
const kVSpace12 = SizedBox(height: 12, width: 0);
const kVSpace16 = SizedBox(height: 16, width: 0);
const kVSpace20 = SizedBox(height: 20, width: 0);
const kVSpace24 = SizedBox(height: 24, width: 0);
const kVSpace32 = SizedBox(height: 32, width: 0);
const kVSpace64 = SizedBox(height: 64, width: 0);
const kVSpace96 = SizedBox(height: 96, width: 0);

/// Horizontal widget spaces
const kHSpace2 = SizedBox(width: 2, height: 0);
const kHSpace3 = SizedBox(width: 3, height: 0);
const kHSpace4 = SizedBox(width: 4, height: 0);
const kHSpace6 = SizedBox(width: 6, height: 0);
const kHSpace8 = SizedBox(width: 8, height: 0);
const kHSpace10 = SizedBox(width: 10, height: 0);
const kHSpace12 = SizedBox(width: 12, height: 0);
const kHSpace16 = SizedBox(width: 16, height: 0);
const kHSpace20 = SizedBox(height: 0, width: 20);
const kHSpace24 = SizedBox(width: 24, height: 0);
const kHSpace32 = SizedBox(width: 32, height: 0);
const kHSpace64 = SizedBox(width: 64, height: 0);
const kHSpace200 = SizedBox(width: 200, height: 0);
const kHSpace145 = SizedBox(width: 145, height: 0);
const kHSpace85 = SizedBox(width: 85, height: 0);

/// Box widget spaces
const kBSpace4 = SizedBox(width: 4, height: 4);

/// Padding
const kSmallPadding = EdgeInsets.all(8);
const kBorderRadius = BorderRadius.all(Radius.circular(8));
const kBorderRadiusTop = BorderRadius.vertical(top: Radius.circular(20));
