import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/movies/movies_cubit.dart';
import 'movie_item.dart';
import '../../../data/models/movies_list_model.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<MoviesCubit>().getMoviesListData(context),
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => Navigator.pushNamed(
                    context,
                    'movie_details_screen',
                    arguments: movies[index],
                  ),
              child: MovieItem(movie: movies[index]));
        },
      ),
    );
  }
}
