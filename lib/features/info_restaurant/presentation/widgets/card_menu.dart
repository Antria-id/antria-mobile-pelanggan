import 'package:flutter/material.dart';
import '../../../../config/themes/themes.dart';

class CardMenu extends StatefulWidget {
  final String title;
  final String desc;
  final int price;
  final String imageUrl;
  final bool promo;
  final VoidCallback onPress;

  const CardMenu({
    Key? key,
    required this.title,
    required this.desc,
    required this.price,
    required this.imageUrl,
    this.promo = false,
    required this.onPress,
  }) : super(key: key);

  @override
  _CardMenuState createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: greyColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                height: 172,
                width: 172,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/menu1.jpg',
                    fit: BoxFit.cover,
                    height: 172,
                    width: 172,
                  );
                },
              ),
            ),
          ),
          widget.promo
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
                      borderRadius: BorderRadius.circular(10),
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
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.desc,
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Rp ${widget.price}',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 4,
              ),
              height: 32,
              width: 136,
              child: itemCount == 0
                  ? TextButton(
                      onPressed: () {
                        widget.onPress();
                        setState(() {
                          itemCount++;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: greyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Beli',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            if (itemCount > 0) {
                              setState(
                                () {
                                  itemCount--;
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 46,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                8,
                              ),
                              topRight: Radius.circular(
                                8,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              itemCount.toString(),
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                itemCount++; // Menambah jumlah item
                              },
                            );
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
