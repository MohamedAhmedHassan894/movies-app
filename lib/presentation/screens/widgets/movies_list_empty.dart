import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_palette.dart';

class MoviesListEmpty extends StatelessWidget {
  const MoviesListEmpty({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'No movies available now, ',
          style: TextStyle(
            color: AppPalette.textGrayColor.withOpacity(.7),
            fontWeight: FontWeight.w600,
          ),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: onTap,
                child: const Text(
                  'Try again.',
                  style: TextStyle(
                    color: AppPalette.accentColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
