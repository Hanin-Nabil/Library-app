import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'simlierListViewDetiales.dart';

class SectiondetailesTWO extends StatelessWidget {
  const SectiondetailesTWO({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "You can also like  ",
          style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        SimlierListviewdetialespage(),
      ],
    );
  }
}
