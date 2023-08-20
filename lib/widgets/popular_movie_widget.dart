import 'package:flutter/material.dart';
import 'package:movieflix/models/movie.dart';
import 'package:movieflix/screens/detail_screen.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: widget.movie.id,
              backdrop_path: widget.movie.backdrop_path,
            ),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/${widget.movie.poster_path}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
