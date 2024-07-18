import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardNominal extends StatelessWidget {
  final int nominal;
  final bool isSelected;
  final Function onTap;

  const CardNominal({
    Key? key,
    required this.nominal,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(nominal);

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 54,
        width: 104,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          color: isSelected ? primaryColor : whiteColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              formattedPrice,
              style: TextStyle(
                fontSize: 24,
                color: isSelected ? whiteColor : blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
