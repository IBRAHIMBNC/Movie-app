import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/constants/app_colors.dart';
import 'package:movie_app/app/data/movies_provider.dart';

class Genre extends Equatable {
  final int id;
  final String name;
  final Color color;
  final RxnString backGroundImage;

  const Genre({
    required this.id,
    required this.name,
    required this.color,
    required this.backGroundImage,
  });

  Genre copyWith({
    int? id,
    String? name,
    Color? color,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      backGroundImage: backGroundImage,
    );
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    final id = map['id'] as int;
    final RxnString image = RxnString();
    Get.find<MoviesProvider>().fetchGenreImage(id.toString()).then(
      (value) {
        image.value = value;
      },
    );

    return Genre(
      id: id,
      name: map['name'],
      color: genreColors[id % genreColors.length],
      backGroundImage: image,
    );
  }

  @override
  String toString() => 'Genre(id: $id, name: $name, color: $color)';

  @override
  List<Object?> get props => [id, name, color];
}
