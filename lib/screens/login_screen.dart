import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paml_flutter_responsi/screens/forgot_password_screen.dart';
import 'package:paml_flutter_responsi/screens/home/main_screen.dart';
import 'package:paml_flutter_responsi/screens/register_screen.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_button.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_text_field.dart';
import 'package:paml_flutter_responsi/src/constants/color.dart';
import 'package:paml_flutter_responsi/src/utils/is_valid_email.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> handleLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: const Text('Email dan password tidak boleh kosong'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    } else if (!isValidEmail(emailController.text)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: const Text('Email tidak valid'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text);
      return true;
    }
  }

  void initiateLogin(BuildContext context) async {
    final bool isLoggedIn = await handleLogin();
    if (isLoggedIn && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Masuk',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              label: 'Masukan Email',
              hintText: 'Email',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Masukan Password',
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Belum Punya Akun?',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Lupa password ?',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Masuk',
              onPressed: () => initiateLogin(context),
            )
          ],
        ),
      ),
    );
  }
}
