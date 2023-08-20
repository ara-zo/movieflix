import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class movieWidget extends StatelessWidget {
  final String title, poster_path, backdrop_path;
  final int id;

  const movieWidget({
    super.key,
    required this.title,
    required this.poster_path,
    required this.id,
    required this.backdrop_path,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              backdrop_path: backdrop_path,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/$poster_path',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
