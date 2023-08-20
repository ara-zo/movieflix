import 'package:flutter/material.dart';
import 'package:movieflix/models/movie.dart';
import 'package:movieflix/widgets/movie_widget.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.movieList,
  });

  final Future<List<Movie>> movieList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var info = snapshot.data![index];
                return SizedBox(
                  width: 150,
                  child: movieWidget(
                    title: info.title,
                    poster_path: info.poster_path,
                    id: info.id,
                    backdrop_path: info.backdrop_path,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
