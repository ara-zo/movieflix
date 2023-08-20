import 'package:flutter/material.dart';
import 'package:movieflix/models/movieInfo.dart';
import 'package:movieflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String backdrop_path;

  const DetailScreen({
    Key? key,
    required this.id,
    required this.backdrop_path,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieInfo> movieInfo;

  @override
  void initState() {
    super.initState();
    movieInfo = ApiService.getMovieInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Back to list',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500/${widget.backdrop_path}',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          FutureBuilder(
            future: movieInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: [
                          for (var genre in snapshot.data!.genres)
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                genre['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!.release_date,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Storyline',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          snapshot.data!.overview,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Text(
                '...',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }
}
