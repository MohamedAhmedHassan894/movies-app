part of 'movies_cubit.dart';

@immutable
abstract class MoviesStates {}

class MoviesInitial extends MoviesStates {}

class GetMoviesLoadingLoadingState extends MoviesStates {}

class GetMoviesSuccessfullyState extends MoviesStates {
  final MoviesListModel moviesListModel;

  GetMoviesSuccessfullyState(this.moviesListModel);
}

class GetMoviesErrorState extends MoviesStates {
  final String error;

  GetMoviesErrorState(this.error);
}
