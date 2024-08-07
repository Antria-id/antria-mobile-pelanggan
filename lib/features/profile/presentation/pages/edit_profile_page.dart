import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/pelanggan_profile/pelanggan_profile_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/bloc/update_profile/update_pelanggan_bloc.dart';
import 'package:antria_mobile_pelanggan/features/profile/presentation/widgets/edit_profile_form_widget.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PelangganProfileBloc()..add(PelangganProfileFetchData()),
      child: BlocListener<UpdatePelangganBloc, UpdatePelangganState>(
        listener: (context, state) {
          if (state is UpdatePelangganSuccess) {
            showToastSuccessMessage(
              'Update Profile Berhasil',
            );
            context.read<PelangganProfileBloc>().add(
                  PelangganProfileFetchData(),
                );
          }
          if (state is UpdatePelangganFailed) {
            showToastFailedMessage(
              'Update Profile Gagal',
            );
          }
        },
        child: const EditProfileFormWidget(),
      ),
    );
  }
}
