import 'package:antria_mobile_pelanggan/features/presentation/pages/info_restaurant.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/themes.dart';

class RecomendationResto extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;

  const RecomendationResto({
    super.key,
    required this.name,
    required this.address,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InfoRestaurantPage(),
          ),
        );
      },
      child: Container(
        height: 102,
        width: 376,
        margin: const EdgeInsets.only(
          top: 16,
        ),
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    8,
                  ),
                  bottomLeft: Radius.circular(
                    8,
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imageUrl,
                  ),
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
                    ),
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
                onPressed: () {},
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
      ),
    );
  }
}
