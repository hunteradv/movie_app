import 'package:dio/dio.dart';
import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/person_response.dart';

import '../model/movie_response.dart';

class MovieRepository {
  final String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMTQzNGM2MWU4ZjJjZDliYWI0ODVhM2RiZDdkOWZiZiIsInN1YiI6IjY0NTcxYTQyNmM4NDkyMDE2MjVmMjg4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.J0XDHWtswqroitmQhnWsFFyBk5oSDl5bb_UZh4mWSfI';
  static String mainUrl = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "pt-br", "page": 1};

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Ocorreu exceção: $error stackTrace: $stacktrace");
      return MovieResponse.withError('$error');
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "pt-br", "page": 1};

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Ocorreu exceção: $error stackTrace: $stacktrace");
      return MovieResponse.withError('$error');
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "pt-br", "page": 1};

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Ocorreu exceção: $error stackTrace: $stacktrace");
      return GenreResponse.withError('$error');
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey, "language": "pt-br", "page": 1};

    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Ocorreu exceção: $error stackTrace: $stacktrace");
      return PersonResponse.withError('$error');
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "pt-br",
      "page": 1,
      "with_genres": id
    };

    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Ocorreu exceção: $error stackTrace: $stacktrace");
      return MovieResponse.withError('$error');
    }
  }
}
