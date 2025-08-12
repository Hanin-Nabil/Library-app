import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import 'Widget/custom_search_Textfield.dart';
import 'Widget/search_reslut_ListView.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextfield(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Search Result  ",
              style: Styles.textstyle18.copyWith(fontFamily: kGTSectraFine),
            ),
            SizedBox(
              height: 10,
            ),
            SearchResultListview(),
          ],
        ),
      ),
    );
  }
}
