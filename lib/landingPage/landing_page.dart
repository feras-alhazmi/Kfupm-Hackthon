import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kfupm_hachthon/components/button.dart';
import 'package:kfupm_hachthon/components/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kfupm_hachthon/landingPage/ax_step.dart';
import 'package:kfupm_hachthon/landingPage/landing_slide.dart';
import '../components/kfupm_logo.dart';
import '../components/spaces.dart';
import '../home_page/home.dart';
import 'expandable.dart';
import 'login_view.dart';
import 'onboarding_flow.dart';

class LandingPage extends HookWidget {
  const LandingPage({super.key});

  static const path = 'assets/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AxLandingPage(
        brand: KfupmLogo(),
        logo: KfupmLogo(),
        // signInOnTap: () {},
        // createAccountOnTap: () {},
        slides: [
          AxLandingSlide(
            illustrationPath: 'roadmap.png',
            slideIndex: 1,
            title: 'Educational Roadmap',
            subtitle: 'A custom major roadmap made by experts made especially for you ',
            paddingAboveIllustration: 20,
            paddingBellowIllustration: 33,
            totalNumberOfSlides: 4,
          ),
          AxLandingSlide(
            illustrationPath: 'major.png',
            slideIndex: 2,
            title: 'Major Guidance',
            subtitle: 'Number of surveys made to help you know your major interests',
            paddingAboveIllustration: 20,
            paddingBellowIllustration: 33,
            totalNumberOfSlides: 4,
          ),
          AxLandingSlide(
            illustrationPath: 'comunity.png',
            slideIndex: 3,
            title: 'Community',
            subtitle: 'Be part of a large community that have the same interest and exchange your knowledge ',
            totalNumberOfSlides: 4,
          ),
          AxLandingSlide(
            illustrationPath: 'course.png',
            slideIndex: 4,
            title: 'Suggested courses',
            subtitle: 'A set of online courses suggested by the community to help you make your way in the map',
            totalNumberOfSlides: 4,
          ),
        ],
        //staticIllustrationPath: 'assets/decorations/onboarding_decoration.svg',
      ),
    );
  }
}

class AxLandingPage extends StatefulWidget {
  const AxLandingPage({
    super.key,
    this.brand,
    this.logo,
    this.createAccountButtonLabel,
    this.signInButtonLabel,
    this.signInOnTap,
    this.createAccountOnTap,
    this.or,
    required this.slides,
    this.staticIllustrationPath,
  });
  final String? createAccountButtonLabel;
  final String? signInButtonLabel;
  final Widget? brand;
  final Widget? logo;
  final GestureTapCallback? signInOnTap;
  final GestureTapCallback? createAccountOnTap;
  final String? staticIllustrationPath;
  final String? or;
  final List<Widget> slides;

  @override
  State<AxLandingPage> createState() => _AxLandingPageState();
}

class _AxLandingPageState extends State<AxLandingPage> {
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: context.backgroundDecoration,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24, top: 24),
                  child: widget.brand ??
                      widget.logo ??
                      const Text(
                        'Logo',
                        style: TextStyle(color: Color.fromARGB(255, 179, 165, 164)),
                      ),
                ),
                kVSpace16,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        widget.staticIllustrationPath != null
                            ? SvgPicture.asset(
                                widget.staticIllustrationPath ?? '',
                                width: MediaQuery.of(context).size.width,
                              )
                            : ExpandablePageView(
                                controller: pageController,
                                onPageChanged: (value) => setState(() => currentIndex = value),
                                children: widget.slides,
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.slides.mapIndexed((i, _) => Indicator(isActive: currentIndex == i)).toList(),
                    ),
                  ],
                ),
                kVSpace24,
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                  child: Container(
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AxButton(
                          title: widget.signInButtonLabel ?? 'Login',
                          color: AxButtonColor.primary,
                          onTap: widget.signInOnTap ?? () => context.pushPage(AxLoginPage(logo: widget.logo)),
                        ),
                        kVSpace12,
                        Row(children: [
                          Expanded(child: Divider(thickness: 0.2, endIndent: 15, color: context.h2)),
                          Text(widget.or ?? 'Or', style: TextStyle(color: context.h2, fontWeight: FontWeight.w100)),
                          Expanded(child: Divider(thickness: 0.2, indent: 15, color: context.h2)),
                        ]),
                        kVSpace12,
                        AxButton(
                          title: widget.createAccountButtonLabel ?? 'Create account now',
                          style: AxButtonStyle.outlined,
                          color: AxButtonColor.primary,
                          onTap: widget.createAccountOnTap ??
                              () => context.pushPage(const AxOnboardingFlow()
                                  // AxSignUpScreen(logo: widget.logo),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Indicator
class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(color: isActive ? context.primary : context.h2, borderRadius: BorderRadius.circular(8)),
    );
  }
}
