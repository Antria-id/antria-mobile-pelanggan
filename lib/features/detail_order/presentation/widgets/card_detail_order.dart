import 'package:flutter/material.dart';
import '../../../../config/themes/themes.dart';

class CardDetailOrder extends StatelessWidget {
  final String name;
  final String desc;
  final String imageUrl;
  final bool promo;
  final int price;
  final int quantity;

  const CardDetailOrder({
    super.key,
    required this.name,
    required this.desc,
    required this.imageUrl,
    this.promo = false,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              borderRadius: BorderRadius.circular(
                10,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
            child: promo == true
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 60,
                      height: 26,
                      margin: const EdgeInsets.only(
                        top: 4,
                        left: 4,
                      ),
                      decoration: BoxDecoration(
                        color: orangeColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Promo!',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
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
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    desc,
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Rp ${price}',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              right: 10,
            ),
            width: 60,
            height: 40,
            decoration: const BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  10,
                ),
                topRight: Radius.circular(
                  10,
                ),
              ),
            ),
            child: Center(
              child: Text(
                '${quantity}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
