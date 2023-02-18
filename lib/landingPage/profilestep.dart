import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kfupm_hachthon/components/textfield.dart';
import 'package:kfupm_hachthon/components/theme.dart';

import '../components/spaces.dart';

class AxProfileStep extends HookWidget {
  const AxProfileStep({super.key});

  @override
  Widget build(BuildContext context) {
    final firstnameController = useTextEditingController();
    final lastnameController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kVSpace16,
        Text(
          'My name ...',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: context.h1),
        ),
        kVSpace16,
        Row(
          children: [
            Expanded(
              child: AxTextField(
                title: 'First Name',
                controller: firstnameController,
                //onChanged: (nv) => axProfileSingleton.set((p) => p.copyWith(firstname: nv)),
              ),
            ),
            kHSpace8,
            Expanded(
                child: AxTextField(
              title: 'Last Name',
              controller: lastnameController,
              // onChanged: //(nv) => axProfileSingleton.set((p) => p.copyWith(lastname: nv)),
            )),
          ],
        ),
        kVSpace20,
      ],
    );
  }
}
