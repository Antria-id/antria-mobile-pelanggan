import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:flutter/material.dart';

class QueueCustomerCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String number;
  const QueueCustomerCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 90,
      margin: const EdgeInsets.only(
        top: 34,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: imageUrl.isNotEmpty
                ? Image.network(
                    '${APIUrl.baseUrl}${APIUrl.imagePath}$imageUrl',
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                    errorBuilder: (context, error, stackTrace) {
                      return CircleAvatar(
                        radius: 30,
                        child: Image.asset(
                          'assets/icons/user-empty.png',
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ),
                      );
                    },
                  )
                : CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                      'assets/icons/user-empty.png',
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const Spacer(),
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  10,
                ),
                bottomRight: Radius.circular(
                  10,
                ),
              ),
            ),
            child: Center(
              child: Text(
                '${number}',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
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
