import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/loading_widget.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/new_password_form.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPPage extends StatefulWidget {
  final String email;
  const VerifyOTPPage({super.key, required this.email});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void submitOTP() {
    print('OTP: ${otpController.text}');
  }

  bool isLoading = false;

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
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verifikasi OTP',
                          style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Masukan kode OTP, yang telah kami kirim ke email anda',
                            style: greyTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        Pinput(
                          length: 4,
                          controller: otpController,
                          onSubmitted: (pin) => submitOTP(),
                          focusedPinTheme: PinTheme(
                            height: 60,
                            width: 56,
                            textStyle: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: greyColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          submittedPinTheme: PinTheme(
                            height: 60,
                            width: 56,
                            textStyle: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          defaultPinTheme: PinTheme(
                            height: 60,
                            width: 56,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: greyColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukan 4-digit OTP';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 44,
                        ),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is VerifyOTPSuccess) {
                              showToastSuccessMessage('Kode OTP berhasil');
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => NewPasswordFormWidget(
                                    token: state.response.accessToken,
                                    id: state.response.userId,
                                  ),
                                ),
                              );
                            }
                            if (state is VerifyOTPFailed) {
                              showToastFailedMessage(
                                'Kode OTP salah',
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
                                  final otp = int.tryParse(otpController.text);
                                  context.read<AuthBloc>().add(
                                        VerifyOTPTapped(
                                          email: widget.email,
                                          otp: otp!,
                                        ),
                                      );
                                }
                              },
                            );
                          },
                        ),
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
