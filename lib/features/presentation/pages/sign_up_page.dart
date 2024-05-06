import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../widgets/form_text_field.dart';
import '../widgets/password_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 140,
                        bottom: 40,
                      ),
                      width: 126,
                      height: 126,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/antria.png',
                          ),
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      onChanged: (value) {},
                      hintText: 'Masukan Nama',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      onChanged: (value) {},
                      hintText: 'Masukan Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordFieldWidget(
                      onChanged: (value) {},
                      hintText: 'Masukkan Password',
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationWidget(),
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
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun?",
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login-page');
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: Color(0xff953684),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff953684),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
