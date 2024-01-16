import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_use_case.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<MovieRecommendation>>> getMovieRecommendation(MovieRecommendationParameters parameters);



}