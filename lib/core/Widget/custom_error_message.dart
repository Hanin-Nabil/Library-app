import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Custom_ErrorMessage extends StatelessWidget {
  const Custom_ErrorMessage(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMessage,
      style: Styles.textstyle18,
    ));
  }
}
