import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/helpers/app_local_storage.dart';
import 'package:movies_app/presentation/base/toasts.dart';
import 'package:movies_app/utils/constants.dart';
import '../../../data/models/movies_list_model.dart';
import '../../../data/repository/movies_repo.dart';
import '../../../helpers/logger_helper.dart';

part 'movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());
  final MoviesRepo moviesRepo;

  static MoviesCubit get(BuildContext context) => BlocProvider.of(context);

  void getMoviesListData(context) async {
    emit(GetMoviesLoadingLoadingState());
    try {
      /// check if there is internet connection or not , and if not load cached data
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        LoggerHelper.logger.e('no internet connection');
        loadCachedData();
      } else {
        var (MoviesListModel response, jsonMovies) =
            await moviesRepo.getMoviesList();
        LoggerHelper.logger.i(response);
        if (response.movies != null) {
          AppLocalStorage.saveMap(AppConstants.localMovies, jsonMovies);
          emit(GetMoviesSuccessfullyState(response));
        } else {
          emit(GetMoviesErrorState('Error while fetching movies'));
        }
      }
    } catch (e) {
      LoggerHelper.logger.e(e.toString());
      emit(GetMoviesErrorState(e.toString()));
    }
  }

  void loadCachedData() async {
    if (await AppLocalStorage.containsKey(AppConstants.localMovies)) {
      Map<String, dynamic>? moviesJson =
          await AppLocalStorage.getMap(AppConstants.localMovies);

      MoviesListModel response = MoviesListModel.fromJson(moviesJson!);
      emit(GetMoviesSuccessfullyState(response));
    } else {
      Toasts.showNotifierToast(message: "Check your internet connection");
      emit(GetMoviesErrorState('No internet connection'));
    }
  }
}
