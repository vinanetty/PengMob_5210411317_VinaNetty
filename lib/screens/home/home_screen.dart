import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paml_flutter_responsi/src/data/movie.dart';
import 'package:paml_flutter_responsi/src/data/music.dart'; 
import 'package:paml_flutter_responsi/src/widgets/custom_container.dart';
import 'package:paml_flutter_responsi/src/widgets/section_title.dart';
import 'package:paml_flutter_responsi/src/widgets/horizontal_scroll_view.dart';
import 'package:paml_flutter_responsi/src/widgets/vertical_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userEmail = "Guest";

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');

    if (email != null && email.isNotEmpty) {
      setState(() {
        userEmail = email; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      key: const Key("HomeScreen"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeBar(),
          const SizedBox(height: 12),
          Text(
            userEmail, 
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 12),
          const SectionTitle(
            title: "Untuk Kamu",
          ),
          const SizedBox(height: 12),
          HorizontalScrollView(musicData: musicData),
          const SizedBox(height: 24),
          const SectionTitle(
            title: "Film Trending",
          ),
          const SizedBox(height: 12),
          VerticalListView(movies: movieData),
        ],
      ),
    );
  }
}

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.account_circle_outlined),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_outlined),
            SizedBox(width: 12),
            Icon(Icons.settings_outlined),
          ],
        )
      ],
    );
  }
}
