import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.arrow_forward)
      ],
    );
  }
}
