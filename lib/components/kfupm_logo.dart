import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfupm_hachthon/components/theme.dart';

class KfupmLogo extends StatelessWidget {
  const KfupmLogo({super.key, this.size = 62});

  final double size;
  static const double planesIntersectionRation = 6 / 10;

  @override
  Widget build(BuildContext context) {
    Widget getKhottaPlaneIcon(Color color) {
      List<BoxShadow> boxShadow = [
        BoxShadow(
          blurRadius: 10,
          color: color.withOpacity(0.15),
          offset: const Offset(-2, 3),
        ),
      ];

      return Image.asset(
        'assets/Logo-removebg-preview.png',
        fit: BoxFit.fill,
      );
    }

    final Widget whitePlane = getKhottaPlaneIcon(context.h1.withOpacity(0.85));
    // final Widget primaryPlane = getKhottaPlaneIcon(context.primary.withOpacity(0.85));

    return Hero(
      tag: 'khotta_logo',
      child: SizedBox(
        height: size,
        width: 140 * 3 - (2 * size * planesIntersectionRation),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: 60,
              height: 80,
              top: 0,
              left: 0,
              child: whitePlane,
            ),
          ],
        ),
      ),
    );
  }
}
