import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paml_flutter_responsi/screens/login_screen.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_button.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_text_field.dart';
import 'package:paml_flutter_responsi/src/constants/color.dart';
import 'package:paml_flutter_responsi/src/utils/is_valid_email.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void handleRegister(BuildContext context) {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: const Text(
                'Email, password, dan konfirmasi password tidak boleh kosong'),
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
    } else if (passwordController.text.length < 8) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: const Text('Password minimal 8 karakter'),
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
    } else if (passwordController.text != confirmPasswordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: const Text('Password dan konfirmasi password tidak sama'),
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
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
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
              'Daftar',
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
            CustomTextField(
              label: 'Masukan Konfirmasi Password',
              hintText: 'Password',
              isPassword: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sudah memiliki akun?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
                onPressed: () => handleRegister(context), text: "Daftar"),
          ],
        ),
      ),
    );
  }
}
