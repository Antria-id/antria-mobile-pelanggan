import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String textCancel;
  final String textConfirm;
  final VoidCallback onCancel;
  final VoidCallback onPressed;
  const DialogWidget({
    super.key,
    required this.title,
    required this.onCancel,
    required this.subtitle,
    required this.textCancel,
    required this.textConfirm,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: blackTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Center(
              child: Text(
                subtitle,
                style: blackTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onCancel,
              child: Text(
                textCancel,
                style: redTextStyle.copyWith(),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                textConfirm,
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
