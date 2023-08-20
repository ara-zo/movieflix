import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie.dart';
import 'package:movieflix/models/movieInfo.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  // endpoint
  // 가장 인기 있는 영화
  static const String popular = "popular";
  // 상영 중인 영화
  static const String nowPlaying = "now-playing";
  // 곧 개봉하는 영화
  static const String comingSoon = "coming-soon";
  // 영화 상세정보
  static const String detail = "movie?id=";

  // 영화 세부 정보
  // https://movies-api.nomadcoders.workers.dev/movie?id=1

  // 가장 인기 있는 영화
  static Future<List<Movie>> getPopularMovies() async {
    List<Movie> popularMovieInstance = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> popularMovies = responseData['results'];
      for (var popularMovie in popularMovies) {
        final instance = Movie.fromJson(popularMovie);
        popularMovieInstance.add(instance);
      }
      return popularMovieInstance;
    }
    throw Error();
  }

// 상영 중인 영화
  static Future<List<Movie>> getNowPlayingMovie() async {
    List<Movie> nowPlayingMovieInstance = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> nowPlayingMovies = responseData['results'];
      for (var nowPlayingMovie in nowPlayingMovies) {
        final instance = Movie.fromJson(nowPlayingMovie);
        nowPlayingMovieInstance.add(instance);
      }
      return nowPlayingMovieInstance;
    }
    throw Error();
  }

  // 곧 개봉하는 영화
  static Future<List<Movie>> getComingSoonMovie() async {
    List<Movie> comingSoonMovieInstance = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> comingSoonMovies = responseData['results'];
      for (var comingSoonMovie in comingSoonMovies) {
        final instance = Movie.fromJson(comingSoonMovie);
        comingSoonMovieInstance.add(instance);
      }
      return comingSoonMovieInstance;
    }
    throw Error();
  }

  // 영화 정보
  static Future<MovieInfo> getMovieInfo(int id) async {
    final url = Uri.parse('$baseUrl/$detail$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final info = jsonDecode(response.body);
      return MovieInfo.fromJson(info);
    }
    throw Error();
  }
}
