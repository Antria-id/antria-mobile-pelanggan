import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/presentation/widgets/recomendation_resto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        height: 262,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              10,
            ),
            bottomRight: Radius.circular(
              10,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Good Morning',
                          style: whiteTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Jeremia',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
              ),
              Container(
                width: 322,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    filled: true,
                    fillColor: greyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: fontGreycolor,
                    ),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget recomendations() {
      List<Map<String, dynamic>> menuItems = [
        {
          'name': 'MIE GACOAN TEBET',
          'address': 'Jl. Tebet Raya No.35, RT.2/RW.2, Tebet Timur Raya.',
          'imageUrl': 'assets/images/restoran1.png',
        },
        {
          'name': 'Sydney Opera',
          'address': 'Jl. Tebet Raya No.35, RT.2/RW.2, Tebet Timur Raya.',
          'imageUrl': 'assets/images/restoran2.png',
        },
        {
          'name': 'Roma',
          'address': 'Jl. Tebet Raya No.35, RT.2/RW.2, Tebet Timur Raya.',
          'imageUrl': 'assets/images/restoran3.png',
        },
        {
          'name': 'Payung Teduh',
          'address': 'Jl. Tebet Raya No.35, RT.2/RW.2, Tebet Timur Raya.',
          'imageUrl': 'assets/images/restoran3.png',
        },
      ];

      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Rekomendasi Untukmu',
              style: greyTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                menuItems.length,
                (index) {
                  final menuItem = menuItems[index];
                  return RecomendationResto(
                    name: menuItem['name'],
                    address: menuItem['address'],
                    imageUrl: menuItem['imageUrl'],
                  );
                },
              ),
            ),
          ],
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
                  recomendations(),
                ],
              ),
              Positioned(
                top: 160,
                left: 0,
                right: 0,
                child: Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                        ),
                        width: 356,
                        height: 178,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/banner1.png'),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                        ),
                        width: 356,
                        height: 178,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/banner1.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        width: 356,
                        height: 178,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/banner1.png',
                            ),
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
      ),
    );
  }
}
