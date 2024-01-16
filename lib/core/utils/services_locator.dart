import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_use_case.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator{
 void setup(){
   ///Bloc
   getIt.registerFactory(() => MovieBloc(getIt(),getIt(),getIt(),),);
   getIt.registerFactory(() => MovieDetailsBloc(getIt(),getIt()),);

   ///use cases
   getIt.registerLazySingleton(() => GetNowPlayingMovieUsecase(getIt()));
   getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));
   getIt.registerLazySingleton(() => GetTopRatedMoviesUsecase(getIt()));
   getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
   getIt.registerLazySingleton(() => GetMovieRecommendationUseCase(getIt()));



   ///repository
   getIt.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(getIt()));
   ///data source
   getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

  }
}
