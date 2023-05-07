import 'movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies =
            (json["movies"] as List).map((e) => Movie.fromJson(e)).toList(),
        error = '';

  MovieResponse.withError(String errorValue)
      : movies = [],
        error = errorValue;
}
