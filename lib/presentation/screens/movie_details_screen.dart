import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_palette.dart';
import '../../data/models/movies_list_model.dart';
import '../../utils/constants.dart';
import '../base/back_button.dart';
import '../base/theme_region.dart';
import 'widgets/rating.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemedAnnotatedRegion(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppConstants.imagesBaseUrl}${movie.backdropPath}',
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) =>
                          Container(color: Colors.grey),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Theme.of(context).colorScheme.background,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Text(
                                movie.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    minimum: const EdgeInsets.only(top: 32),
                    child: MoviesBackButton(
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              Builder(builder: (context) {
                if (movie.voteAverage == null) {
                  return const SizedBox();
                } else {
                  return RatingWidget(movie.voteAverage!);
                }
              }),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppPalette.primaryColor,
                        wordSpacing: 1.5,
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
