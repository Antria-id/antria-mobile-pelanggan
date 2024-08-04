import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPForm extends StatefulWidget {
  OTPForm({
    super.key,
  });

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _submitOTP() {
    print('OTP: ${_otpController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      controller: _otpController,
      onSubmitted: (pin) => _submitOTP(),
      focusedPinTheme: PinTheme(
        height: 60,
        width: 56,
        textStyle: blackTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
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
          fontWeight: FontWeight.bold,
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
      errorTextStyle: redTextStyle,
    );
  }
}
