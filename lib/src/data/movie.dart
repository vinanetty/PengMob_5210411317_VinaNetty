import 'package:paml_flutter_responsi/src/models/movie.dart';

final List<Movie> movieData = [
  Movie(
    imageUrl: "https://upload.wikimedia.org/wikipedia/id/9/9e/Lovely_bones_ver2.jpg",
    title: "The Lovely Bones",
    description: "Seorang gadis remaja yang dibunuh, namun ia dapat menyaksikan dari Surga bagaimana keluarga dan kerabat menemukan siapa pembunuhnya",
    duration: 135,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Movie(
    imageUrl: "https://upload.wikimedia.org/wikipedia/id/8/88/Poster_film_The_Big_4.jpg",
    title: "The Big 4",
    description: "Seorang detektif yang bekerja sama dengan 4 mantan pembunuh bayaran untuk mengungkap misteri pembunuhan ayahnya",
    duration: 141,
    date: DateTime.now().subtract(const Duration(days: 5)), 
  ),
  Movie(
    imageUrl: "https://upload.wikimedia.org/wikipedia/id/0/01/Poster_Agak_Laen_%282024%29.jpg",
    title: "Agak Laen",
    description: "4 sahabat yang mengelola rumah hantu di pasar malam",
    duration: 119,
    date: DateTime.now().subtract(const Duration(days: 40)), 
  ),
  Movie(
    imageUrl: "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/indizone/2021/01/31/OjsZdaq/sinopsis-parasite-2019-kebohongan-keluarga-gi-taek-terhadap-keluarga-park28.jpg",
    title: "Parasite",
    description: "Keluarga pas-pasan yang memalsukan identitas untuk mengelabui keluarga kaya demi menumpang hidup",
    duration: 132,
    date: DateTime(2021, 5, 20), 
  ),
];
