import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/presentation/widgets/card_menu.dart';
import 'package:antria_mobile_pelanggan/features/presentation/widgets/custom_buttton_service.dart';
import 'package:flutter/material.dart';

class InfoRestaurantPage extends StatefulWidget {
  const InfoRestaurantPage({super.key});

  @override
  State<InfoRestaurantPage> createState() => _InfoRestaurantPageState();
}

class _InfoRestaurantPageState extends State<InfoRestaurantPage> {
  bool isSelected = false;
  bool isSelectedDineIn = true;
  bool isSelectedTakeaway = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 172,
              height: 172,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/restoran1.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Mie Gacoan Tebet',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Jl. Tebet Raya No.35, RT.2/RW.2, Tebet Tim., Kec. Tebet, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12820',
                      style: greyTextStyle.copyWith(
                        fontSize: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '10.00 - 00.01 WIB',
                      style: blackTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 2,
                          ),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/star.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 2,
                          ),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/star.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 2,
                          ),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/star.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 2,
                          ),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/star.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 2,
                          ),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/star.png'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget service() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 22,
        ),
        child: Row(
          children: [
            CustomButtonService(
              title: 'Dine In',
              isSelected: isSelectedDineIn,
              onTap: () {
                setState(() {
                  isSelectedDineIn = true;
                  isSelectedTakeaway = false;
                });
              },
            ),
            CustomButtonService(
              title: 'Takeaway',
              isSelected: isSelectedTakeaway,
              onTap: () {
                setState(
                  () {
                    isSelectedTakeaway = !isSelectedTakeaway;
                    isSelectedDineIn = false;
                  },
                );
              },
            ),
          ],
        ),
      );
    }

    Widget menu() {
      List<Map<String, dynamic>> menuItems = [
        {
          'title': 'Menu 1',
          'desc': 'Description 1',
          'price': 10000,
          'imageUrl': 'assets/images/menu1.jpg',
          'promo': true,
        },
        {
          'title': 'Menu 2',
          'desc': 'Description 2',
          'price': 15000,
          'imageUrl': 'assets/images/menu2.jpg',
          'promo': false,
        },
        {
          'title': 'Menu 1',
          'desc': 'Description 1',
          'price': 10,
          'imageUrl': 'assets/images/menu1.jpg',
          'promo': true,
        },
        {
          'title': 'Menu 1',
          'desc': 'Description 1',
          'price': 10000,
          'imageUrl': 'assets/images/menu1.jpg',
          'promo': false,
        },
        {
          'title': 'Menu 1',
          'desc': 'Description 1',
          'price': 10000,
          'imageUrl': 'assets/images/menu1.jpg',
          'promo': true,
        },
      ];

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.7,
          ),
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return CardMenu(
              title: menuItems[index]['title'],
              desc: menuItems[index]['desc'],
              price: menuItems[index]['price'],
              imageUrl: menuItems[index]['imageUrl'],
              promo: menuItems[index]['promo'] ?? false,
            );
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  header(),
                  service(),
                  menu(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
