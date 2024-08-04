import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/password_text_field.dart';
import 'package:antria_mobile_pelanggan/shared/custom_button.dart';
import 'package:antria_mobile_pelanggan/shared/validator.dart';
import 'package:flutter/material.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ValidatorForm validatorForm = ValidatorForm();

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukan Konfirmasi password';
    }
    if (value != passwordController.text) {
      return 'Password Harus Sama';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buat Password Baru',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Masukan password baru Anda',
                    style: greyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  PasswordFieldWidget(
                    controller: passwordController,
                    onChanged: (value) {},
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PasswordFieldWidget(
                    controller: confirmPasswordController,
                    onChanged: (value) {},
                    validator: validateConfirmPassword,
                    hintText: 'Konfirmasi Password',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    title: 'Kirim',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                          context,
                          '/login-page',
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
