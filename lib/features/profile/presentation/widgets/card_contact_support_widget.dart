import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class CardContactSupportWidget extends StatelessWidget {
  final String icon;
  final String label;
  final String link;
  final VoidCallback onTap;
  const CardContactSupportWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.link,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    icon,
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        label,
                        style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        link,
                        style: blackTextStyle.copyWith(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
