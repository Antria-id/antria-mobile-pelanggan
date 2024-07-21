import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class MitraChatWidget extends StatelessWidget {
  final String name;
  final String text;
  final String time;

  const MitraChatWidget({
    super.key,
    required this.name,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: blackTextStyle,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      text,
                      style: whiteTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            time,
            style: greyTextStyle,
          )
        ],
      ),
    );
  }
}
