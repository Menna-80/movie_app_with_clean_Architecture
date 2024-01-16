import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_detail_use_case.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_recommendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationsUsecase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getMovieRecommendationsUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationsEvent event, Emitter<MovieDetailsState> emit) async{
    final result =
    await getMovieRecommendationsUsecase(MovieRecommendationParameters(movieId: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            movieRecommendationState: RequestState.error,
            movieRecommendationMessage: l.message)),
            (r) => emit(state.copyWith(
            movieRecommendationState: RequestState.loaded, movieRecommendations: r)));
  }
}
