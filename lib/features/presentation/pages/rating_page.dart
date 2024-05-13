import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  Color starColor1 = greyColor;
  Color starColor2 = greyColor;
  Color starColor3 = greyColor;
  Color starColor4 = greyColor;
  Color starColor5 = greyColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon_rating.png',
              height: 162,
              width: 168,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Berikan Penilaianmu Tentang Kami',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      starColor1 = const Color(0xFFF2C94C);
                      starColor2 = greyColor;
                      starColor3 = greyColor;
                      starColor4 = greyColor;
                      starColor5 = greyColor;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: starColor1,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      starColor1 = const Color(0xFFF2C94C);
                      starColor2 = const Color(0xFFF2C94C);
                      starColor3 = greyColor;
                      starColor4 = greyColor;
                      starColor5 = greyColor;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: starColor2,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      starColor1 = const Color(0xFFF2C94C);
                      starColor2 = const Color(0xFFF2C94C);
                      starColor3 = const Color(0xFFF2C94C);
                      starColor4 = greyColor;
                      starColor5 = greyColor;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: starColor3,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      starColor1 = const Color(0xFFF2C94C);
                      starColor2 = const Color(0xFFF2C94C);
                      starColor3 = const Color(0xFFF2C94C);
                      starColor4 = const Color(0xFFF2C94C);
                      starColor5 = greyColor;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: starColor4,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      starColor1 = const Color(0xFFF2C94C);
                      starColor2 = const Color(0xFFF2C94C);
                      starColor3 = const Color(0xFFF2C94C);
                      starColor4 = const Color(0xFFF2C94C);
                      starColor5 = const Color(0xFFF2C94C);
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: starColor5,
                    size: 30,
                  ),
                ),
              ],
            ),
            CustomButton(
              title: 'Kirim Rating',
              onPressed: () {
                Navigator.pushNamed(context, '/thanks-page');
              },
              width: 354,
              radius: 40,
              margin: const EdgeInsets.only(
                top: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
