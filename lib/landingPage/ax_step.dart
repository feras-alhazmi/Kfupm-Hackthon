import 'dart:math';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:flutter/material.dart';
import 'package:kfupm_hachthon/components/theme.dart';
import 'package:kfupm_hachthon/landingPage/landing_page.dart';
import 'package:kfupm_hachthon/landingPage/stepper.dart';

import '../components/button.dart';
import '../components/spaces.dart';
import 'appbaraction.dart';

class AxStep {
  final String? title;
  final String? subtitle;
  final Widget content;
  final String? nextTitle;
  final Future<bool> Function()? onNext;

  const AxStep({
    this.title,
    this.subtitle,
    required this.content,
    this.nextTitle,
    this.onNext,
  });
}

class AxSteppedPage extends HookWidget {
  const AxSteppedPage({
    super.key,
    required this.title,
    this.allowJumpingSteps = true,
    this.init,
    this.onClose,
    required this.steps,
    required this.completedBody,
    this.useProgressIndicatorInsteadOfSteps = false,
    this.useTopBackButton = false,
  });

  final String title;
  final bool allowJumpingSteps;
  final void Function()? init;
  final void Function()? onClose;
  final List<AxStep> steps;
  final Widget completedBody;
  final bool useProgressIndicatorInsteadOfSteps;
  final bool useTopBackButton;

  @override
  Widget build(BuildContext context) {
    final currentStepNumber = useState(0);
    final isCompleted = useState(false);
    final currentStep = steps[currentStepNumber.value];
    TextStyle style = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1.3, color: context.h1);

    //useRunOnce(init ?? () {});

    void goBack() {
      currentStepNumber.value = max(0, currentStepNumber.value - 1);
    }

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: (!useTopBackButton || currentStepNumber.value == 0 || isCompleted.value)
            ? null
            : InkWell(
                onTap: goBack,
                child: Center(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(start: AxeSpace.s12),
                    child: Text('Back', style: style),
                  ),
                ),
              ),
        title: Text(title, style: style),
        // actions: [
        //   AxAppBarAction(
        //     iconData: Icons.close,
        //     onTap: onClose ?? context.navigator.pop,
        //     trailingOne: true,
        //   ),
        // ],
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          decoration: context.backgroundDecoration,
          child: KeyboardDismissOnTap(
            child: AxStepper(
              useProgressIndicatorInsteadOfSteps: useProgressIndicatorInsteadOfSteps,
              steps: steps
                  .mapIndexed<Step>(
                    (i, s) => Step(
                      title: const SizedBox.shrink(),
                      content: isCompleted.value
                          ? completedBody
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (s.title != null || s.subtitle != null) kVSpace8,
                                if (s.title != null) Text(s.title!, style: style),
                                if (s.title != null && s.subtitle != null) kVSpace8,
                                if (s.subtitle != null) Text(s.subtitle!, style: style),
                                if (s.title != null || s.subtitle != null) kVSpace16,
                                s.content,
                              ],
                            ),
                      state: currentStepNumber.value > i || isCompleted.value ? StepState.complete : StepState.indexed,
                      isActive: currentStepNumber.value >= i,
                    ),
                  )
                  .toList(),
              type: StepperType.horizontal,
              currentStep: currentStepNumber.value,
              onStepTapped: (step) => currentStepNumber.value = step,
              onStepCancel: goBack,
              onStepContinue: () async {
                /// Before last step
                if (currentStepNumber.value < steps.length - 1) {
                  if (currentStep.onNext != null) {
                    final shouldContinue = await currentStep.onNext!.call();
                    if (!shouldContinue) return;
                  }
                  currentStepNumber.value++;
                }

                /// Last step
                else {
                  print('heloooo');
                  if (currentStep.onNext != null) {
                    final shouldComplete = await currentStep.onNext!.call();
                    if (!shouldComplete) return;
                  }
                  isCompleted.value = true;
                }
              },
              controlsBuilder: (context, ControlsDetails controls) {
                final isLastStep = currentStepNumber.value == steps.length - 1;

                return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
                  if (isKeyboardVisible || isCompleted.value) return const SizedBox.shrink();

                  return Row(children: [
                    if (!useTopBackButton && currentStepNumber.value != 0) ...[
                      AxButton(
                        title: currentStepNumber.value == 0 ? 'Cancel' : 'Back',
                        color: AxButtonColor.primary,
                        onTap: controls.onStepCancel,
                        expanded: true,
                      ),
                      kHSpace12,
                    ],
                    AxButton(
                      title: currentStep.nextTitle ?? (isLastStep ? 'Confirm' : 'Next'),
                      color: AxButtonColor.primary,
                      onTap: controls.onStepContinue,
                      expanded: true,
                    ),
                  ]);
                });
              },
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}

extension ListExtensions<E> on List<E> {
  Iterable<R> mapIndexed<R>(R Function(int index, E element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}
