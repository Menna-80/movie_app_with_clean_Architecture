import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movies_events.dart';
import 'package:movie_app/movies/presentation/controller/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MovieBloc(this.getNowPlayingMovieUsecase, this.getTopRatedMoviesUsecase,
      this.getPopularMoviesUsecase)
      : super(const MoviesState()) {

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMovieUsecase(const NoParameters());

    result.fold(
        (l) => emit(
              state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingmessage: l.message,
              ),
            ),
        (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded,
              nowPlayingMovies: r,
            )));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    result.fold(
          (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularmessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedmessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
