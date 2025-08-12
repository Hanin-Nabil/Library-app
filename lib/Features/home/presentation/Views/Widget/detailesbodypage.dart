import 'package:flutter/material.dart';

import '../../../data/models/book_model/book_model.dart';
import 'customdetailesAppbar.dart';
import 'sectiondetailesOne.dart';
import 'sectiondetailesTwo.dart';

class Detailesbodypage extends StatelessWidget {
  const Detailesbodypage({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SafeArea(child: CustomDetailesAppbar()),
                SectiondetailesOne(book: bookModel,
                 
                ),
                SectiondetailesTWO(),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
