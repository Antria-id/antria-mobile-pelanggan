import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarWidget({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      width: 322,
      child: TextFormField(
        onChanged: (value) {
          onSearch(value); // Notify parent widget with the entered keyword
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          filled: true,
          fillColor: whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: 14,
            color: fontGreycolor,
          ),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
