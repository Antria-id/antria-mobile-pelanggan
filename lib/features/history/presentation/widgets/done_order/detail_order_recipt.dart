import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailOrderRecipt extends StatelessWidget {
  final String name;
  final String desc;
  final int price;
  final int quantity;

  const DetailOrderRecipt({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 4.0), // Add padding to space out items
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items at the top
            children: [
              Text(
                '$quantity X ',
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      desc,
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Ensure description text doesn't overflow
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                formattedPrice,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                ),
                textAlign: TextAlign.right, // Align price text to the right
              ),
            ],
          ),
        ],
      ),
    );
  }
}
