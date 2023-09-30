import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_palette.dart';
import 'movie_poster_widget.dart';
import '../../../utils/app_size_boxes.dart';
import '../../../utils/constants.dart';
import '../../../data/models/movies_list_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 150.0,
      height: MediaQuery.of(context).size.height * 0.23,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 33.0, bottom: 10, right: 10),
            padding: const EdgeInsets.only(
                top: 10.0, left: 10, right: 10, bottom: 15),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.22,
            decoration: BoxDecoration(
              color: AppPalette.cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.15),
                  offset: const Offset(5.0, 4.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                (MediaQuery.of(context).size.width * 0.30).widthBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppPalette.primaryColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    12.heightBox,
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Language: ${movie.originalLanguage}',
                          style: const TextStyle(
                            color: AppPalette.textGrayColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    15.heightBox,
                    SizedBox(
                      height: 22,
                      width: 70,
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(1.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppPalette.successColor),
                        ),
                        onPressed: () {},
                        child: Text(
                          '${movie.voteAverage}  IMDB',
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: AppPalette.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MoviePosterWidget(
            posterPath: '${AppConstants.imagesBaseUrl}${movie.posterPath}',
          ),
        ],
      ),
    );
  }
}
