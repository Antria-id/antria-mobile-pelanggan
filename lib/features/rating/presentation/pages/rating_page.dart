import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/widgets/review_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../shared/custom_button.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
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
                RatingBar.builder(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 32.0,
                  itemPadding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  ignoreGestures: false,
                  onRatingUpdate: (double value) {},
                ),
                const ReviewField(),
                CustomButton(
                  title: 'Kirim Rating',
                  onPressed: () {
                    Navigator.pushNamed(context, '/thanks-page');
                  },
                  width: 354,
                  radius: 40,
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
