// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:movie_app/app/constants/app_strings.dart';

class Movie extends Equatable {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String backgroundImage;

  const Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.backgroundImage,
  });

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
    String? imagePath,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      backgroundImage: imagePath ?? this.backgroundImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    final posterPath = map['poster_path'] as String?;
    final backdropPath = map['backdrop_path'] as String?;
    final bgImage = backdropPath ?? posterPath ?? '';
    final imagePath = ksImageBaseUrl + bgImage;

    return Movie(
      adult: map['adult'] as bool,
      backdropPath: map['backdrop_path'] as String?,
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      id: map['id'] as int,
      originalLanguage: map['original_language'] as String,
      originalTitle: map['original_title'] as String,
      overview: map['overview'] as String,
      popularity: map['popularity'] as double,
      posterPath: map['poster_path'] as String?,
      // releaseDate: map['release_date'].isNotEmpty
      //     ? DateTime.parse(map['release_date'])
      //     : DateTime.now(),

      releaseDate:
          DateTime.tryParse(map['release_date'] as String) ?? DateTime.now(),
      title: map['title'] as String,
      video: map['video'] as bool,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
      backgroundImage: imagePath,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      adult,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
    ];
  }
}
