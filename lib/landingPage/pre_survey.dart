import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kfupm_hachthon/components/textfield.dart';
import 'package:kfupm_hachthon/components/theme.dart';
import 'package:kfupm_hachthon/home_page/home.dart';
import 'package:kfupm_hachthon/landingPage/Survey.dart';

import '../components/spaces.dart';

class PreSurveyStep extends HookWidget {
  const PreSurveyStep({super.key});

  @override
  Widget build(BuildContext context) {
    // final firstnameController = useTextEditingController();
    // final lastnameController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kVSpace32,
        Center(
          child: Text(
            'Pick your situation ',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: context.h1),
          ),
        ),
        kVSpace32,
        Container(
          height: 300,
          child: Column(
            children: [
              Expanded(child: SituationCard(text: "Take the survey", onTap: () => context.pushPage(Survey()))),
              kVSpace20,
              Expanded(child: SituationCard(text: "I know my major", onTap: () => context.pushPage(Survey()))),
            ],
          ),
        ),
        // kVSpace20,
      ],
    );
  }
}

class SituationCard extends StatelessWidget {
  const SituationCard({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.bg2.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: context.h1, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
