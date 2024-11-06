import 'package:flutter/material.dart';
import 'package:paml_flutter_responsi/src/data/profile.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_button.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_container.dart';
import 'package:paml_flutter_responsi/src/widgets/custom_text_field.dart';
import 'package:paml_flutter_responsi/src/widgets/card_profile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      key: const Key("AccountScreen"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardProfile(item: profileData),
          const SizedBox(height: 16),
          const CustomTextField(label: "Email", hintText: "Masukkan Email"),
          const SizedBox(height: 16),
          const CustomTextField(label: "Nama", hintText: "Masukkan Nama"),
          const SizedBox(height: 16),
          const CustomTextField(
              label: "Nomor Telepon", hintText: "Masukkan Nomor Telepon"),
          const SizedBox(height: 16),
          const CustomTextField(label: "Alamat", hintText: "Masukkan Alamat"),
          const SizedBox(height: 16),
          Center(
            child: CustomButton(
              onPressed: () {},
              text: "Ubah Profil",
            ),
          ),
        ],
      ),
    );
  }
}
