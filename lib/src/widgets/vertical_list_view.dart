import 'package:flutter/material.dart';
import 'package:paml_flutter_responsi/src/models/movie.dart';
import 'list_movie.dart';

class VerticalListView extends StatelessWidget {
  final List<Movie> movies;

  const VerticalListView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), 
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: ListMovie(
            imageUrl: movie.imageUrl,
            title: movie.title,
            description: movie.description,
            duration: movie.duration,
            date: movie.date,
          ),
        );
      },
    );
  }
}
