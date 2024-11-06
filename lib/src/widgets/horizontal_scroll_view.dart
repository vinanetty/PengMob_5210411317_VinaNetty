import 'package:flutter/material.dart';
import 'package:paml_flutter_responsi/src/models/music.dart';
import 'card_music.dart';

class HorizontalScrollView extends StatelessWidget {
  final List<Music> musicData;

  const HorizontalScrollView({
    super.key,
    required this.musicData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: musicData.length,
        itemBuilder: (context, index) {
          final data = musicData[index];
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CardMusic(
              imageUrl: data.imageUrl,
              artist: data.artist,
              song: data.song,
            ),
          );
        },
      ),
    );
  }
}
