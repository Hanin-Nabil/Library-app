// ignore_for_file: duplicate_import

import 'package:booklyapp/Features/home/presentation/Views/Widget/CustomImageItem.dart';
import 'package:booklyapp/Features/home/presentation/mange/FeaturedBooks/featured_books_cubit.dart';
import 'package:booklyapp/core/Widget/custom_error_message.dart';
import 'package:booklyapp/core/Widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'CustomImageItem.dart';

class Customlistview extends StatelessWidget {
  const Customlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kdetailespage,
                            extra: state.books[index]);
                      },
                      child: CustomImageItem(
                          imageUrl: state
                              .books[index].volumeInfo.imageLinks!.thumbnail),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return Custom_ErrorMessage(state.errorMessage);
        } else {
          return CustomLoading();
        }
      },
    );
  }
}
