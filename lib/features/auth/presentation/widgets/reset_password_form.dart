import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/form_text_field.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/loading_widget.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:antria_mobile_pelanggan/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordFormWidget extends StatefulWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  State<ResetPasswordFormWidget> createState() =>
      _ResetPasswordFormWidgetState();
}

class _ResetPasswordFormWidgetState extends State<ResetPasswordFormWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  late String email;
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
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 26,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Lupa Password',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
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
                                    'Masukan email, untuk mengganti password kamu',
                                    style: greyTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 47,
                                ),
                                TextFieldWidget(
                                  onChanged: (value) {
                                    email = value.trim();
                                  },
                                  hintText: 'Email',
                                  validator: validatorForm.validateEmail,
                                  controller: emailController,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                BlocConsumer<AuthBloc, AuthState>(
                                  listener: (context, state) {
                                    if (state is SendOTPSuccess) {
                                      showToastSuccessMessage(
                                        'Kode OTP dikirim ke email kamu',
                                      );
                                      Navigator.pushNamed(
                                        context,
                                        '/verify-otp-page',
                                        arguments: state.email,
                                      );
                                    } else if (state is SendOTPFailed) {
                                      showToastFailedMessage(
                                        'Kode OTP gagal dikirim',
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
                                                SendEmailTapped(
                                                  email: email,
                                                ),
                                              );
                                        }
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 55,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: whiteColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          18,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Batal',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isLoading) const LoadingWidget()
      ],
    );
  }
}
