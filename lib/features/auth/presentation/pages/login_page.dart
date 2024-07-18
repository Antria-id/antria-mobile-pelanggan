import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../shared/bottom_navigation.dart';
import '../widgets/form_text_field.dart';
import '../widgets/password_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 170,
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
                        controller: usernameController,
                        onChanged: (value) {
                          username = value.trim();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan Username Anda';
                          } else if (value.length < 6) {
                            return 'Username harus terdiri dari 6 karakter!';
                          }
                          return null;
                        },
                        hintText: 'Masukan Username',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordFieldWidget(
                        controller: passwordController,
                        onChanged: (value) {
                          password = value.trim();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan Password Anda';
                          } else if (value.length < 6) {
                            return 'Password harus terdiri dari 6 karakter!';
                          }
                          return null;
                        },
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
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Fluttertoast.showToast(
                                  msg: "Login Berhasil",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationWidget(),
                                  ),
                                );
                              }
                              if (state is LoginFailed) {
                                Fluttertoast.showToast(
                                  msg: "Login Gagal, Coba Lagi",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          LoginButtonTapped(
                                            request: LoginRequest(
                                              username: usernameController.text,
                                              password: passwordController.text,
                                            ),
                                          ),
                                        );
                                  }
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
                                  'Masuk',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Belum punya akun?",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-up');
                            },
                            child: const Text(
                              'Daftar Sekarang',
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
      ),
    );
  }
}
