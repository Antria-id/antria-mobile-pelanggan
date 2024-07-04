import 'package:flutter/material.dart';
import '../../../../config/themes/themes.dart';

class RecomendationResto extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;
  final VoidCallback onPressed;
  final double rating;

  const RecomendationResto({
    super.key,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.onPressed,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 376,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          18,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 102,
            margin: const EdgeInsets.only(
              right: 16,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  8,
                ),
                bottomLeft: Radius.circular(
                  8,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/empty_store.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    address,
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/star.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${rating}',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 40,
              right: 10,
            ),
            height: 32,
            width: 82,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Lihat',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
