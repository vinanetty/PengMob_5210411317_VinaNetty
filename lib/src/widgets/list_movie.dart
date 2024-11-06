import 'package:flutter/material.dart';

class ListMovie extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int duration;
  final DateTime date;

  const ListMovie({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.duration,
    required this.date,
  });

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return "Hari ini";
    } else if (difference.inDays == 1) {
      return "Kemarin";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} hari yang lalu";
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return "$months bulan yang lalu";
    } else {
      return "${date.year}";
    }
  }

  String formatDuration(int minutes) {
    if (minutes < 60) {
      return "$minutes min";
    } else {
      final hours = minutes ~/ 60;
      final mins = minutes % 60;
      return "$hours h ${mins.toString().padLeft(2, '0')} min";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder.jpg',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.add_circle_outline,
                              size: 20, color: Colors.black),
                          const SizedBox(width: 4),
                          Text(
                            formatDate(date),
                            style: const TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.circle,
                              size: 4, color: Colors.black),
                          const SizedBox(width: 8),
                          Text(
                            formatDuration(duration),
                            style: const TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.play_arrow)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
