// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfo _$MovieInfoFromJson(Map<String, dynamic> json) => MovieInfo(
      homepage: json['homepage'] as String,
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      release_date: json['release_date'] as String,
      title: json['title'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      vote_average: (json['vote_average'] as num).toDouble(),
      runtime: json['runtime'] as int,
    );

Map<String, dynamic> _$MovieInfoToJson(MovieInfo instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'genres': instance.genres,
      'vote_average': instance.vote_average,
      'runtime': instance.runtime,
    };
