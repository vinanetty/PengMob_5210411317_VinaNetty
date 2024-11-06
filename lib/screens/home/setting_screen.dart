import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paml_flutter_responsi/screens/login_screen.dart';
import 'package:paml_flutter_responsi/src/data/profile.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_container.dart';
import 'package:paml_flutter_responsi/src/widgets/card_profile.dart';
import 'package:paml_flutter_responsi/src/widgets/list_menu.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final List<String> menuItems = [
    "Kelola Akun",
    "Notifikasi",
    "Privacy Policy",
    "Terms of Service"
  ];

  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> handleLogout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    showToast(context, "Berhasil Logout");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      key: const Key("LogoutScreen"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardProfile(
            item: profileData,
          ),
          const SizedBox(height: 16),
          ListMenu(
            items: menuItems,
            onTap: (item) => showToast(context, item),
          ),
          GestureDetector(
            onTap: () => handleLogout(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
