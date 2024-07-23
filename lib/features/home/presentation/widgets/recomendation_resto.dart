import 'package:flutter/material.dart';
import '../../../../config/themes/themes.dart';

class RecomendationResto extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;
  final VoidCallback onPressed;
  final double rating;
  final String statusResto;
  final bool isDisabled;

  const RecomendationResto({
    super.key,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.onPressed,
    required this.rating,
    required this.statusResto,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 316,
      decoration: BoxDecoration(
        color: isDisabled ? greyColor : whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 102,
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      color: isDisabled ? Colors.grey : null,
                      colorBlendMode: isDisabled ? BlendMode.saturation : null,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/empty_store.png',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/empty_store.png',
                      fit: BoxFit.cover,
                      color: isDisabled ? greyColor : null,
                      colorBlendMode: isDisabled ? BlendMode.saturation : null,
                    ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      color: isDisabled ? blackColor : null,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          address,
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                            color: isDisabled ? blackColor : null,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/star.png',
                        width: 22,
                        height: 22,
                        color: isDisabled ? Colors.grey : null,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$rating',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          color: isDisabled ? Colors.grey : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                statusResto == 'CLOSE' ? 'Tutup' : 'Buka',
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  color: isDisabled ? redColor : Colors.green,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 10),
                height: 32,
                width: 82,
                child: TextButton(
                  onPressed: isDisabled ? onPressed : onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: isDisabled ? Colors.grey : primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Lihat',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                      color: isDisabled ? blackColor : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
