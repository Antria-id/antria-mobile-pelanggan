import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/logout/logout_bloc.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutLoadedState) {
          showToastSuccessMessage('Logout Berhasil');
          Navigator.pushNamedAndRemoveUntil(
              context, '/login-page', (route) => false);
        }
        if (state is LogoutErrorState) {
          showToastFailedMessage('Logout Gagal');
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Konfirmasi',
              style: blackTextStyle,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Text(
                    'Anda yakin ingin logout?',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text(
                    'Cancel',
                    style: whiteTextStyle.copyWith(
                      color: redColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Logout',
                    style: whiteTextStyle.copyWith(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {
                    context.read<LogoutBloc>().add(
                          const LogoutEvent.onLogoutTapped(),
                        );
                    showToastSuccessMessage('Logout Berhasil');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login-page', (route) => false);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
