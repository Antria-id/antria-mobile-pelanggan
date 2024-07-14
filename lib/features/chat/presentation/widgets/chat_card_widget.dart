import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

class CardChatWidget extends StatelessWidget {
  final String nama;
  final String message;
  final String image;
  final String countChat;
  final VoidCallback? onTap;
  const CardChatWidget({
    super.key,
    required this.nama,
    required this.message,
    required this.image,
    required this.countChat,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 360,
              height: 86,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: whiteColor,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(image),
                      onBackgroundImageError: (exception, stackTrace) {
                        const Icon(Icons.person_2_rounded);
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            nama,
                            style: blackTextStyle,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            message,
                            style: greyTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: const Color(0xff88FFA9),
              radius: 14,
              child: Text(
                countChat.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
