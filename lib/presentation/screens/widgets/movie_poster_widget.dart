import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_palette.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({Key? key, required this.posterPath})
      : super(key: key);
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      alignment: Alignment.center,
      imageUrl: posterPath,
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0.0, 4.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            image: CachedNetworkImageProvider(posterPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (
        context,
        error,
      ) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20.0,
          ),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.15,
          child: const CupertinoActivityIndicator(
            radius: 20,
            color:AppPalette.primaryColor,
          ),
        );
      },
      errorWidget: (context, error, stackTrace) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20.0,
          ),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: const Image(
              color: Colors.grey,
              image: AssetImage('assets/placeholder_image.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }
}
