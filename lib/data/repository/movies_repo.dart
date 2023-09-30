import '../webservices/movies_webservice.dart';
import '../models/movies_list_model.dart';

class MoviesRepo {
  MoviesRepo(this.moviesWebServices);

  final MoviesWebServices moviesWebServices;

  Future<(MoviesListModel, Map<String, dynamic>)> getMoviesList() async {
    Map<String, dynamic> moviesListResponse =
        await moviesWebServices.getMoviesList();
    return (MoviesListModel.fromJson(moviesListResponse), moviesListResponse);
  }
}
