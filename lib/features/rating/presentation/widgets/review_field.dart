import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class ReviewField extends StatelessWidget {
  const ReviewField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: TextFormField(
        maxLength: 2500,
        maxLines: 5,
        decoration: const InputDecoration(
          fillColor: greyColor,
          filled: true,
          hintText: 'Berikan tanggapanmu',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
