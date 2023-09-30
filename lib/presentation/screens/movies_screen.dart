import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_palette.dart';
import 'widgets/movies_list.dart';
import '../../business_logic/cubit/movies/movies_cubit.dart';
import '../base/error_message.dart';
import 'widgets/movies_list_empty.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "  Home",
          style: TextStyle(
            fontSize: 30,
            color: AppPalette.primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: BlocBuilder<MoviesCubit, MoviesStates>(
          builder: (context, state) {
            if (state is GetMoviesLoadingLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetMoviesSuccessfullyState) {
              return state.moviesListModel.movies!.isEmpty
                  ? MoviesListEmpty(
                      onTap: () => context
                          .read<MoviesCubit>()
                          .getMoviesListData(context),
                    )
                  : MovieList(
                      movies: state.moviesListModel.movies ?? [],
                    );
            } else {
              return ErrorMessage(
                onTap: () =>
                    context.read<MoviesCubit>().getMoviesListData(context),
              );
            }
          },
        ),
      ),
    );
  }
}
