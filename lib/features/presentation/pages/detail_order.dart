import 'package:antria_mobile_pelanggan/features/presentation/widgets/card_detail_order.dart';
import 'package:flutter/material.dart';

import '../../../config/themes/themes.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({super.key});

  Widget header() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 26,
          ),
          child: Text(
            'Menu Terpilih',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget reviewMenu() {
    List<Map<String, dynamic>> menuItems = [
      {
        'imageUrl': 'assets/images/menu1.jpg',
        'desc': 'Level 0-5',
        'name': 'Mie Gacoan',
        'promo': true,
        'price': 10000,
        'quantity': 3,
      },
      {
        'imageUrl': 'assets/images/menu1.jpg',
        'desc': 'Level 0-5',
        'name': 'Mie Gacoan',
        'promo': false,
        'price': 12000,
        'quantity': 2,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          menuItems.length,
          (index) {
            return CardDetailOrder(
              name: menuItems[index]['name'],
              desc: menuItems[index]['desc'],
              imageUrl: menuItems[index]['imageUrl'],
              promo: menuItems[index]['promo'] ?? false,
              price: menuItems[index]['price'],
              quantity: menuItems[index]['quantity'],
            );
          },
        ),
      ),
    );
  }

  Widget detailPrice() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Harga item',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                'Rp. 60.000',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Biaya Layanan',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                'Rp. 12.000',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget totalPrice() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Text(
            'Harga total',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const Spacer(),
          Text(
            'Rp. 72.000',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethod() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          top: 60,
        ),
        width: 337,
        height: 67,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Transform.rotate(
                angle: 90 * 3.1415926535 / 180,
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Method Payment',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Cash',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                'Rp72.000',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buyOrder(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          const Divider(),
          const Row(
            children: [
              Text(
                'Yuk, Pakai Vouchermu',
              ),
              Spacer(),
              Text(
                'Voucher',
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 240,
            height: 56,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/taking-queue-page');
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Bayar',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            reviewMenu(),
            detailPrice(),
            totalPrice(),
            paymentMethod(),
            buyOrder(context),
          ],
        ),
      ),
    );
  }
}
