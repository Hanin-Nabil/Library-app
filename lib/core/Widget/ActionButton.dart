import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/core/funcation/custom_url_launch.dart';
import 'package:flutter/material.dart';

import '../../Features/home/presentation/Views/Widget/custombutton.dart';

class Actionbutton extends StatelessWidget {
  const Actionbutton({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            text: 'Free',
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              customUrlLaunch(context, bookModel.volumeInfo.previewLink);
            },
            fontsize: 16,
            backgroundcolor: Color(0xffef8262),
            textcolor: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            text: get(bookModel),
          ),
        ),
      ],
    );
  }

  String get(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not available";
    } else {
      return "Preview";
    }
  }
}
