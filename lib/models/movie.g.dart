// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      adult: json['adult'] as bool,
      backdrop_path: json['backdrop_path'] as String,
      id: json['id'] as int,
      original_language: json['original_language'] as String,
      original_title: json['original_title'] as String,
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      release_date: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      vote_count: json['vote_count'] as int,
      popularity: (json['popularity'] as num).toDouble(),
      vote_average: (json['vote_average'] as num).toDouble(),
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'backdrop_path': instance.backdrop_path,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'adult': instance.adult,
      'video': instance.video,
      'id': instance.id,
      'vote_count': instance.vote_count,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'vote_average': instance.vote_average,
    };
