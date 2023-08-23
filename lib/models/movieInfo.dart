import 'package:json_annotation/json_annotation.dart';

part 'movieInfo.g.dart';

@JsonSerializable()
class MovieInfo {
  final String homepage, overview, poster_path, release_date, title;

  final List<Map<String, dynamic>> genres;

  final double vote_average;

  final int runtime;

  MovieInfo({
    required this.homepage,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.genres,
    required this.vote_average,
    required this.runtime,
  });

  factory MovieInfo.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieInfoToJson(this);
}
