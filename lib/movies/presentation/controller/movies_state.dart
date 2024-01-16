import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable{
  final List<Movie> nowPlayingMovies;
  final String nowPlayingmessage;
  final RequestState nowPlayingState;
  final List<Movie> popularMovies;
  final String popularmessage;
  final RequestState popularState;
  final List<Movie> topRatedMovies;
  final String topRatedmessage;
  final RequestState topRatedState;

  const MoviesState({
    this.nowPlayingMovies= const[],
    this.nowPlayingmessage='',
    this.nowPlayingState=RequestState.loading,
    this.popularMovies= const[],
    this.popularmessage='',
    this.popularState=RequestState.loading,
    this.topRatedMovies= const[],
    this.topRatedmessage='',
    this.topRatedState=RequestState.loading

  });
MoviesState copyWith({
   List<Movie>? nowPlayingMovies,
   String? nowPlayingmessage,
   RequestState? nowPlayingState,
   List<Movie>? popularMovies,
   String? popularmessage,
   RequestState? popularState,
   List<Movie>? topRatedMovies,
   String? topRatedmessage,
   RequestState? topRatedState,
}){
  return MoviesState(
      nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies,
      nowPlayingmessage: nowPlayingmessage?? this.nowPlayingmessage,
      nowPlayingState: nowPlayingState??this.nowPlayingState,
      popularMovies: popularMovies??this.popularMovies,
      popularmessage: popularmessage??this.popularmessage,
      popularState: popularState??this.popularState,
      topRatedMovies: topRatedMovies??this.topRatedMovies,
      topRatedmessage: topRatedmessage??this.topRatedmessage,
      topRatedState: topRatedState??this.topRatedState,





  );
}
  @override
  List<Object> get props =>[
    nowPlayingMovies,
    nowPlayingmessage,
    nowPlayingState,
    popularMovies,
    popularState,
    popularmessage,
    topRatedState,
    topRatedmessage,
    topRatedMovies
  ];
}