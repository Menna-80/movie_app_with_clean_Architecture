import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/netwark/error_massege_model.dart';
import 'package:movie_app/movies/data/model/movie_detail_model.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';
import 'package:movie_app/movies/data/model/recommendation_model.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_use_case.dart';

import '../../../core/utils/constance.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
 Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMovieRecommendation(MovieRecommendationParameters parameters);


}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
 Future<List<MovieModel>> getNowPlayingMovies() async{
    final response= await Dio().get(ApiConstance.nowPlayingPath);

    if(response.statusCode==200){

      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromjson(e),
      ));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
    final response= await Dio().get(ApiConstance.popularPath);

    if(response.statusCode==200) {
      return List<MovieModel>.from((response.data["results"] as List).map((e) =>
          MovieModel.fromjson(e),));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response= await Dio().get(ApiConstance.topRatedPath);

    if(response.statusCode==200) {
      return List<MovieModel>.from((response.data["results"] as List).map((e) =>
          MovieModel.fromjson(e),));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));

    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200){
      return MovieDetailsModel.fromjson(response.data);
    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }

  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(MovieRecommendationParameters parameters)async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(parameters.movieId));

    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data["results"]as List).map((e) => RecommendationModel.fromjson(e),));
    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }


   
  }

  
}