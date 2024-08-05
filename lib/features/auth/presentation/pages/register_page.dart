import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/form_text_field.dart';
import '../widgets/password_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String name;
  late String username;
  late String email;
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
                        controller: nameController,
                        onChanged: (value) {
                          name = value.trim();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan Nama Anda';
                          }
                          return null;
                        },
                        hintText: 'Nama',
                      ),
                      const SizedBox(
                        height: 20,
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
                        hintText: 'Username',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        controller: emailController,
                        onChanged: (value) {
                          email = value.trim();
                        },
                        validator: (value) {
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (value == null || value.isEmpty) {
                            return 'Email Tidak Boleh Kosong!';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Masukan Alamat Email Dengan Benar!';
                          }
                          return null;
                        },
                        hintText: 'Email',
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
                            return 'Masukan Password Anda';
                          } else if (value.length < 6) {
                            return 'Password harus terdiri dari 6 karakter!';
                          }
                          return null;
                        },
                        hintText: 'Password',
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
                              if (state is RegisterSuccess) {
                                Fluttertoast.showToast(
                                  msg: "Register Berhasil",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/login-page',
                                );
                              }
                              if (state is RegisterFailed) {
                                Fluttertoast.showToast(
                                  msg: "Register Gagal, Coba Lagi",
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
                              return ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          RegisterButtonTapped(
                                            request: RegisterRequest(
                                              nama: nameController.text,
                                              username: usernameController.text,
                                              email: emailController.text,
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
                                child: Text(
                                  'Daftar',
                                  style: whiteTextStyle.copyWith(
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
                          Text(
                            "Sudah punya akun?",
                            style: blackTextStyle,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login-page');
                            },
                            child: Text(
                              'Masuk',
                              style: blueTextStyle,
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
