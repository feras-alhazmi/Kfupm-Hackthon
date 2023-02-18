import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfupm_hachthon/components/theme.dart';

import '../components/spaces.dart';

class AxLandingSlide extends StatelessWidget {
  const AxLandingSlide({
    super.key,
    this.illustrationPath,
    required this.slideIndex,
    this.title,
    this.subtitle,
    this.paddingAboveIllustration,
    this.paddingBellowIllustration,
    required this.totalNumberOfSlides,
  });
  final String? illustrationPath;
  final int slideIndex;
  final String? title;
  final String? subtitle;
  final double? paddingAboveIllustration;
  final double? paddingBellowIllustration;
  final int totalNumberOfSlides;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: context.mediaQuery.size.height * 0.6),
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: paddingAboveIllustration ?? 40),

          /// Illustration
          Image.asset(
            illustrationPath ?? '',
            height: min(context.mediaQuery.size.height * 0.25, 250),
          ),
          SizedBox(height: paddingBellowIllustration ?? 40),

          // Number of slide
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                width: 50,
                height: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$slideIndex ', style: TextStyle(color: context.h1)),
                    Text('of', style: TextStyle(color: context.h1)),
                    Text(' $totalNumberOfSlides', style: TextStyle(color: context.h1))
                  ],
                ),
              ),
            ],
          ),
          kVSpace16,
          Text(
            title!,
            style: TextStyle(
              color: context.h1,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle ?? '',
            style: TextStyle(
              color: context.h2,
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }

  screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
