import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paml_flutter_responsi/screens/login_screen.dart';
import 'package:paml_flutter_responsi/src/utils/is_valid_email.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_button.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_text_field.dart';
import 'package:paml_flutter_responsi/src/constants/color.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  void handleForgotPassword(BuildContext context) {
    if (emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: const Text('Email tidak boleh kosong'),
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
            const SizedBox(height: 16),
            const Text(
              'Lupa Password',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pesan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukan email Anda dan tunggu kode etik akan dikirimkan.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 48),
            CustomTextField(
              label: 'Masukan Email',
              hintText: 'Email',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () => handleForgotPassword(context),
              text: 'Kirim',
            ),
          ],
        ),
      ),
    );
  }
}
