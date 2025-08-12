import 'package:flutter/material.dart';

import '../../../../home/presentation/Views/Widget/Custom_ListView_Item.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              // child: CustomListViewItem(),
              child: Text("data"),
            );
          }),
    );
  }
}
