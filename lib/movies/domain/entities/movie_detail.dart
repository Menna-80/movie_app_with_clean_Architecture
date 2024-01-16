import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String overView;
  final String title;
  final String releaseDate;
  final int runTime;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetails({
      required this.id,
      required this.backdropPath,
      required this.overView,
      required this.title,
      required this.releaseDate,
      required this.runTime,
      required this.voteAverage,
      required this.genres
      });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        overView,
        title,
        releaseDate,
        runTime,
        voteAverage,
        genres
      ];
}
