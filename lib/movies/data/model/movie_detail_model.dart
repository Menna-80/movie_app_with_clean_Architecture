import 'package:movie_app/movies/data/model/genres_model.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';
import 'package:movie_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetails{
 const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.overView,
    required super.title,
    required super.releaseDate,
    required super.runTime,
    required super.voteAverage,
    required super.genres
  });

  factory MovieDetailsModel.fromjson(Map<String, dynamic> json)=> MovieDetailsModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
      overView: json["overview"],
      title: json["title"],
      releaseDate: json["release_date"],
      runTime: json["runtime"],
      voteAverage: json["vote_average"].toDouble(),
      genres: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromjson(e)))
  );

}