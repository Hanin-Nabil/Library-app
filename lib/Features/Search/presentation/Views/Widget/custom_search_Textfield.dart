import 'package:booklyapp/Features/home/presentation/mange/Searchbook/searchbook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key, });
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: TextField(
        controller:searchController ,
        decoration: InputDecoration(
          enabledBorder: BuildSearchTextFiled(),
          focusedBorder: BuildSearchTextFiled(),
          hintText: "Search",
          suffixIcon: Opacity(
            opacity: .7,
            child: IconButton(
              onPressed: () {
             String query = searchController.text.trim();
        if (query.isNotEmpty) {
          context.read<SearchbookCubit>().fetchSearchBook(query);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("يرجى إدخال نص للبحث!")),
          );
        }
              },
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              iconSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder BuildSearchTextFiled() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
