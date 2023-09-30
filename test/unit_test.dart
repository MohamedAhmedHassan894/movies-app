import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/data/models/movies_list_model.dart';
import 'package:movies_app/data/repository/movies_repo.dart';
import 'package:movies_app/data/webservices/movies_webservice.dart';

void main() {
  test("Test sending Api request and verifying response", () async {
    // bool movies
    MoviesWebServices moviesWebServices = MoviesWebServices();
    MoviesRepo moviesRepo = MoviesRepo(moviesWebServices);
    var (MoviesListModel response, _) = await moviesRepo.getMoviesList();
    expect(response.movies?.length, 20);
    // you can change 'adult' test to true to cover this case
    expect(response.movies?[0].adult, false);
    expect(response.page, 1);
  });
}
