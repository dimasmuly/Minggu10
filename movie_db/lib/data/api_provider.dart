import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client, Response;
import 'package:movie_db/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '0f4b9a83c9c8fe786a4334abe4132338';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response = 
    await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return PopularMovies.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}