import 'package:booklyapp/Features/home/presentation/mange/SimilerBooks/similerbook_cubit.dart';
import 'package:booklyapp/core/Widget/custom_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Widget/custom_loading.dart';
import 'CustomImageItem.dart';

class SimlierListviewdetialespage extends StatelessWidget {
  const SimlierListviewdetialespage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: BlocBuilder<SimilerbookCubit, SimilerbookState>(
        builder: (context, state) {
          if (state is SimilerbookSuccess) {
            return ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomImageItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    ),
                  );
                });
          } else if (state is SimilerbookFailure) {
            return Custom_ErrorMessage(state.errorMessage);
          } else {
            return CustomLoading();
          }
        },
      ),
    );
  }
}
