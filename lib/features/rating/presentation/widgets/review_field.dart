import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class ReviewField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? initialValue;
  const ReviewField({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        maxLength: 2500,
        maxLines: 5,
        decoration: InputDecoration(
          fillColor: greyColor,
          filled: true,
          hintText: 'Berikan tanggapanmu',
          hintStyle: greyTextStyle.copyWith(),
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
