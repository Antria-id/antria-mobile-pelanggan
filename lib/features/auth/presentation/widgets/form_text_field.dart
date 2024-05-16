import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.initialValue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.grey[300],
      ),
    );
  }
}
