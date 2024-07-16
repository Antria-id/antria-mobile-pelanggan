import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/bloc/reviews/reviews_bloc.dart';
import 'package:antria_mobile_pelanggan/features/rating/presentation/widgets/review_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RatingPage extends StatefulWidget {
  final int mitraId;
  const RatingPage({Key? key, required this.mitraId}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  late String commentText = '';
  late double rate = 0;
  late TextEditingController commentController = TextEditingController();
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
                  initialRating: rate,
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
                  onRatingUpdate: (rating) {
                    setState(() {
                      rate = rating;
                    });
                  },
                  unratedColor: greyColor,
                ),
                ReviewField(
                  controller: commentController,
                  onChanged: (value) {
                    commentText = value.trim();
                  },
                ),
                BlocConsumer<ReviewsBloc, ReviewsState>(
                  listener: (context, state) {
                    if (state is ReviewsLoadedState) {
                      Fluttertoast.showToast(
                        msg: "Reviews Berhasil",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/thanks-page', (route) => false);
                    }
                    if (state is ReviewsErrorState) {
                      Fluttertoast.showToast(
                        msg: "Reviews Gagal Ditambahkan, Coba Lagi",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ReviewsLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 24,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ReviewsBloc>().add(
                                  ReviewsEvent.onReviewsTapped(
                                    reviewsRequest: ReviewsRequest(
                                      komentar: commentController.text,
                                      rating: rate.toInt() * 10,
                                      mitraId: widget.mitraId,
                                    ),
                                    mitraId: widget.mitraId,
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(116, 30),
                            backgroundColor: const Color(0xff953684),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none,
                            ),
                          ),
                          child: const Text(
                            'Kirim',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
