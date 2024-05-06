import 'package:antria_mobile_pelanggan/features/presentation/pages/detail_order.dart';
import 'package:flutter/material.dart';
import '../../../config/themes/themes.dart';

class CardMenu extends StatefulWidget {
  final String title;
  final String desc;
  final int price;
  final String imageUrl;
  final bool promo;

  const CardMenu({
    Key? key,
    required this.title,
    required this.desc,
    required this.price,
    required this.imageUrl,
    this.promo = false,
  }) : super(key: key);

  @override
  _CardMenuState createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailOrderPage(),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 234,
        margin: const EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: greyColor,
          ),
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 80,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.imageUrl,
                  ),
                ),
              ),
              child: widget.promo
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
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
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
                margin: const EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                height: 32,
                width: 126,
                child: itemCount == 0
                    ? TextButton(
                        onPressed: () {
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
                                    itemCount--; // Mengurangi jumlah item jika lebih dari 0
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
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: 46,
                            height: 36,
                            decoration: BoxDecoration(
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
                              child: Icon(
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
      ),
    );
  }
}
