import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/form_text_field.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/loading_widget.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/widgets/password_text_field.dart';
import 'package:antria_mobile_pelanggan/shared/bottom_navigation.dart';
import 'package:antria_mobile_pelanggan/shared/custom_toast.dart';
import 'package:antria_mobile_pelanggan/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String username;
  late String password;
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
              backgroundColor: whiteColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/antria.png',
                      height: 126,
                      width: 126,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          children: [
                            TextFieldWidget(
                              key: Key('username'),
                              onChanged: (value) {
                                username = value.trim();
                              },
                              hintText: 'Username',
                              validator: validatorForm.validateUsername,
                              controller: usernameController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PasswordFieldWidget(
                              key: Key('password'),
                              onChanged: (value) {
                                password = value.trim();
                              },
                              hintText: 'Password',
                              validator: validatorForm.validatePassword,
                              controller: passwordController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/forgot-password-page',
                                    );
                                  },
                                  child: Text(
                                    'Lupa Password?',
                                    style: purpleTextStyle.copyWith(),
                                  ),
                                ),
                                Spacer(),
                                BlocConsumer<AuthBloc, AuthState>(
                                  listener: (context, state) {
                                    if (state is LoginSuccess) {
                                      showToastSuccessMessage('Login Berhasil');
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigationWidget(),
                                        ),
                                      );
                                    }
                                    if (state is LoginFailed) {
                                      showToastFailedMessage(
                                        'Username atau Password Salah',
                                      );
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                  builder: (context, state) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(
                                                LoginButtonTapped(
                                                  request: LoginRequest(
                                                    username:
                                                        usernameController.text,
                                                    password:
                                                        passwordController.text,
                                                  ),
                                                ),
                                              );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(116, 30),
                                        backgroundColor:
                                            const Color(0xff953684),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide.none,
                                        ),
                                      ),
                                      child: Text('Masuk',
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 15,
                                          )),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Belum punya akun?",
                                  style: blackTextStyle,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/sign-up',
                                    );
                                  },
                                  child: Text(
                                    'Daftar',
                                    style: purpleTextStyle,
                                  ),
                                ),
                              ],
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
        if (isLoading) const LoadingWidget()
      ],
    );
  }
}
