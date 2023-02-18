import 'package:flutter/material.dart';
import 'package:kfupm_hachthon/components/button.dart';
import 'package:kfupm_hachthon/components/theme.dart';

import '../components/spaces.dart';

class MajorDescription extends StatelessWidget {
  const MajorDescription({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: context.backgroundDecoration,
        child: SafeArea(
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  child: Container(
                    height: 390,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kVSpace24,
                        Row(
                          children: [
                            Text(
                              "Artificial intelligence",
                              style: TextStyle(color: context.h1, fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: const [AxButton(title: "Join community"), AxButton(title: "Ask pro")],
                            )
                          ],
                        ),
                        kVSpace16,
                        if (subtitle != null) ...[
                          Text(
                            subtitle ?? '',
                            style: TextStyle(color: context.h2, fontSize: 20, fontWeight: FontWeight.w100),
                          ),
                          kVSpace32,
                        ],

                        kVSpace12,
                        // AxButton(
                        //   title: firstButtonTitle ?? '',
                        //   color: AxButtonColor.primary,
                        //   onTap: firstButtonFunction,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverFillRemaining(hasScrollBody: false),
            ],
          ),
        ),
      ),
    );
  }
}
