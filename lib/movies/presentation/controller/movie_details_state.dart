part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final MovieDetails? movieDetails;

  final RequestState movieRecommendationState;
  final String movieRecommendationMessage;
  final List<MovieRecommendation> movieRecommendations;

  const MovieDetailsState(
      {
        this.movieDetailsState = RequestState.loading,
        this.movieDetailsMessage = '',
        this.movieDetails,

        this.movieRecommendationState = RequestState.loading,
        this.movieRecommendationMessage = '',
        this.movieRecommendations = const []
      });

  MovieDetailsState copyWith(
      {
        RequestState? movieDetailsState,
        String? movieDetailsMessage,
        MovieDetails? movieDetails,

        RequestState? movieRecommendationState,
        String? movieRecommendationMessage,
        List<MovieRecommendation>? movieRecommendations
      })
  {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,

        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,

        movieDetailsState: movieDetailsState ?? this.movieDetailsState,

        movieRecommendationMessage:
            movieRecommendationMessage ?? this.movieRecommendationMessage,

        movieRecommendations: movieRecommendations ?? this.movieRecommendations,

        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState);
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetails,
        movieDetailsMessage,
        movieRecommendationState,
        movieRecommendations,
        movieRecommendationMessage
      ];
}
