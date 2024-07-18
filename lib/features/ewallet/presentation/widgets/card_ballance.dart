import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/error_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CardBallance extends StatelessWidget {
  final int ballance;
  const CardBallance({super.key, this.ballance = 100000});

  @override
  Widget build(BuildContext context) {
    String formattedPrice(int ballance) {
      return NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp ',
        decimalDigits: 0,
      ).format(ballance);
    }

    return BlocProvider(
      create: (context) => PelangganProfileBloc()
        ..add(
          GetPelangganFetchDataEvent(),
        ),
      child: Container(
        height: 78,
        width: 356,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: whiteColor,
        ),
        child: BlocBuilder<PelangganProfileBloc, PelangganProfileState>(
          builder: (context, state) {
            if (state is PelangganProfileStateErrorState) {
              return ErrorFetchData();
            } else if (state is PelangganProfileStateLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo Anda :',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      formattedPrice(state.pelangganModel.wallet!),
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
