import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;

  final bool adult, video;

  final int id, vote_count;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;

  final double popularity, vote_average;

  Movie({
    required this.adult,
    required this.backdrop_path,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_count,
    required this.popularity,
    required this.vote_average,
    required this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
