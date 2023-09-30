import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/helpers/logger_helper.dart';
import '../../utils/constants.dart';

class MoviesWebServices {
  final moviesApiChannel = const MethodChannel('com.TMDb/movies');
  final methodChannelArguments = {
    'baseUrl': AppConstants.baseUrl,
    'apiKey': AppConstants.apiKey,
    'moviesGetUri': AppConstants.moviesGetUri
  };

  Future<dynamic> getMoviesList() async {
    try {
      if (Platform.isAndroid) {
        return jsonDecode(await getMoviesFromAndroidNativeCall());
      } else {
        return jsonDecode(await getMoviesHttpCall());
      }
    } catch (error) {
      return Future.error(
        "movies get data error",
        StackTrace.fromString(
          ('this is its trace'),
        ),
      );
    }
  }

  getMoviesFromAndroidNativeCall() async {
    /// this is invoke the native code for android platform that gets the movies data from [Movies] Api
    var response = await moviesApiChannel.invokeMethod(
      "getMoviesData",
      methodChannelArguments,
    );
    LoggerHelper.logger.i(
      response,
    );
    return response;
  }

  getMoviesHttpCall() async {
    http.Response response = await http.get(
      Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.moviesGetUri}?api_key=${AppConstants.apiKey}'),
    );
    return response.body;
  }
}
