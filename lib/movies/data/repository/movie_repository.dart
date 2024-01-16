import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_use_case.dart';



class MovieRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);



  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
   final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
   try{
     return Right(result);
   }on ServerException catch(failure){
     return left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies()async {
    final result= await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters)async {
    final result= await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendation(MovieRecommendationParameters parameters)async {
    final result= await baseMovieRemoteDataSource.getMovieRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }



}