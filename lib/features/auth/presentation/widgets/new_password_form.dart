import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/loading_widget.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/password_text_field.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:antria_mobile_pelanggan/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordFormWidget extends StatefulWidget {
  final int id;
  final String token;
  const NewPasswordFormWidget(
      {super.key, required this.id, required this.token});
  @override
  _NewPasswordFormWidgetState createState() => _NewPasswordFormWidgetState();
}

class _NewPasswordFormWidgetState extends State<NewPasswordFormWidget> {
  final formKey = GlobalKey<FormState>();
  String newPassword = '';
  String confPassword = '';
  bool isLoading = false;
  ValidatorForm validatorForm = ValidatorForm();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: isLoading ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: isLoading,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 26,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Buat Password Baru',
                            style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              'Masukkan password baru anda',
                              style: greyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 62,
                          ),
                          PasswordFieldWidget(
                            onChanged: (value) {
                              setState(() {
                                newPassword = value.trim();
                              });
                            },
                            hintText: 'Password',
                            validator: validatorForm.validatePassword,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PasswordFieldWidget(
                            onChanged: (value) {
                              setState(() {
                                confPassword = value.trim();
                              });
                            },
                            hintText: 'Konfirmasi Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Konfirmasi password tidak boleh kosong';
                              }
                              if (value != newPassword) {
                                return 'Password harus sama';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is UpdatePasswordSuccess) {
                                showToastSuccessMessage(
                                  'Update Password Berhasil',
                                );
                                Navigator.pushNamed(
                                  context,
                                  '/login-page',
                                );
                              } else if (state is UpdatePasswordFailed) {
                                showToastFailedMessage(
                                  'Failed to Update Password',
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                title: 'Kirim',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    context.read<AuthBloc>().add(
                                          UpdatePasswordTapped(
                                            id: widget.id,
                                            password: newPassword,
                                            token: widget.token,
                                          ),
                                        );
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isLoading) LoadingWidget(),
      ],
    );
  }
}
