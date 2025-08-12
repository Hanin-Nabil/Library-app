import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Widget/ActionButton.dart';
import '../../../../../core/utils/styles.dart';
import 'CustomImageItem.dart';
import 'customRate.dart';

class SectiondetailesOne extends StatelessWidget {
  const SectiondetailesOne({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: CustomImageItem(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ""),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          book.volumeInfo.title!,
          style: Styles.textstyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(book.volumeInfo.authors?[0] ?? "",
              style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal,
              )),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomRate(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 15,
        ),
        Actionbutton(
          bookModel: book,
        ),
      ],
    );
  }
}
