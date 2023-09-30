import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/movies/movies_cubit.dart';
import '../data/repository/movies_repo.dart';
import '../data/models/movies_list_model.dart';
import '../data/webservices/movies_webservice.dart';
import '../presentation/screens/movies_screen.dart';
import '../presentation/screens/movie_details_screen.dart';

class AppRouter {
  late MoviesRepo moviesRepo;

  AppRouter() {
    moviesRepo = MoviesRepo(MoviesWebServices());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                MoviesCubit(moviesRepo)..getMoviesListData(context),
            child: const MoviesScreen(),
          ),
        );

      case 'movie_details_screen':
        Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(movie: movie),
          settings: RouteSettings(
            arguments: movie,
          ),
        );
    }
    return null;
  }
}
