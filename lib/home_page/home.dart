import 'package:flutter/material.dart';
import 'package:kfupm_hachthon/components/spaces.dart';
import 'package:kfupm_hachthon/components/theme.dart';

import 'major_discription.dart';

class HomePage extends StatelessWidget {
  final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  final ScrollController _horizontal = ScrollController(initialScrollOffset: 170), _vertical = ScrollController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 15),
        height: double.infinity,
        decoration: context.backgroundDecoration,
        child: Scrollbar(
          controller: _vertical,
          child: Scrollbar(
            controller: _horizontal,
            notificationPredicate: (notif) => notif.depth == 1,
            child: SingleChildScrollView(
              controller: _vertical,
              reverse: true,
              child: SingleChildScrollView(
                  controller: _horizontal,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Column(children: [
                    Row(children: const [
                      kHSpace200,
                      LargeFork(
                        title: "project management",
                      ),
                      HDots(),
                      kHSpace8,
                      HDots(),
                      kHSpace85
                    ]),
                    BigDot(),
                    kVSpace12,
                    BigDot(),
                    Row(children: const [
                      kHSpace200,
                      LargeFork(
                        title: "programing development",
                      ),
                      HDots(),
                      kHSpace8,
                      HDots(),
                      kHSpace85
                    ]),
                    BigDot(),
                    Row(children: const [
                      kHSpace200,
                      LargeFork(
                        title: "java",
                      ),
                      HDots(),
                      kHSpace8,
                      HDots(),
                      kHSpace85
                    ]),
                    Row(
                      children: [kHSpace145, const BigDot(), kHSpace145, VDots()],
                    ),
                    Row(children: [
                      kHSpace200,
                      LargeFork(
                        title: "python",
                        onTap: () => context.pushPage(MajorDescription(
                          subtitle: 'kkkkkkkk',
                        )),
                      ),
                      HDots(),
                      kHSpace8,
                      HDots(),
                      kHSpace85
                    ]),
                  ])
                  // DataTable(
                  //   columns: const <DataColumn>[
                  //     DataColumn(label: Text('Preview')),
                  //     DataColumn(label: Text('Color')),
                  //     DataColumn(label: Text('Shade')),
                  //   ],
                  //   rows: [
                  //     for (var color in Colors.primaries)
                  //       for (var shade in shades)
                  //         DataRow(
                  //           cells: [
                  //             DataCell(Container(height: 20, width: 50, color: color[shade])),
                  //             DataCell(Text(color.toString())),
                  //             DataCell(Text('$shade')),
                  //           ],
                  //         ),
                  //   ],
                  // ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class HDots extends StatelessWidget {
  const HDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
        ),
        kHSpace12,
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
        ),
        kHSpace12,
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
        ),
      ],
    );
  }
}

class VDots extends StatelessWidget {
  const VDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
        ),
        kVSpace12,
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
        ),
        kVSpace12,
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
        ),
        kVSpace12,
      ],
    );
  }
}

class LargeFork extends StatelessWidget {
  const LargeFork({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(400),
            color: Colors.grey,
          ),
          child: Center(
              child: Text(
            title,
            overflow: TextOverflow.clip,
          )),
        ),
      ),
    );
  }
}

class BigDot extends StatelessWidget {
  const BigDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
        ),
        kVSpace8,
        Container(
          height: 20,
          width: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
