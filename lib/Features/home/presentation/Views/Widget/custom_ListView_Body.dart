import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/presentation/Views/Widget/Custom_ListView_Item.dart';
import 'package:booklyapp/Features/home/presentation/mange/newestBooks/newestbooks_cubit.dart';
import 'package:booklyapp/core/Widget/custom_error_message.dart';
import 'package:booklyapp/core/Widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewBody extends StatelessWidget {
  const ListViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbooksSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CustomListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewestbooksFailure) {
          return Custom_ErrorMessage(state.errorMessage);
        } else {
          return CustomLoading();
        }
      },
    );
  }
}
