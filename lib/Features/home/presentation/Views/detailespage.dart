import 'package:booklyapp/Features/home/presentation/mange/SimilerBooks/similerbook_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book_model/book_model.dart';
import 'Widget/detailesbodypage.dart';

class DetailesPage extends StatefulWidget {
  const DetailesPage({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  State<DetailesPage> createState() => _DetailesPageState();
}

class _DetailesPageState extends State<DetailesPage> {
  @override
  @override
  void initState() {
    BlocProvider.of<SimilerbookCubit>(context)
        .fechSimilerBook(category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Detailesbodypage(
        bookModel: widget.bookModel,
      ),
    );
  }
}
