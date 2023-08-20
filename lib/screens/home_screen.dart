import 'package:flutter/material.dart';
import 'package:movieflix/models/movie.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/movie_list_widget.dart';
import 'package:movieflix/widgets/popular_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<Movie>> popularMovies = ApiService.getPopularMovies();
  final Future<List<Movie>> nowPlayingMovies = ApiService.getNowPlayingMovie();
  final Future<List<Movie>> comingSoonMovies = ApiService.getComingSoonMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              popularMovieList(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Now in Cinemas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              MovieList(movieList: nowPlayingMovies),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Coming soon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              MovieList(movieList: comingSoonMovies),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Movie>> popularMovieList() {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var popular = snapshot.data![index];
                return PopularMovie(movie: popular);
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
