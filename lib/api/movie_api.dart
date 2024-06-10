import 'package:http/http.dart' as http;
import 'package:list_item_apps/data/movie_model.dart';
import 'dart:convert';

class MovieApi {
  static const String baseUrl =
      'https://666524d7d122c2868e3fe0c9.mockapi.io/api/listApp/Movie';

  static Future<List<Movie>> getMovies() async {
    final Uri uri = Uri.parse(baseUrl);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  static Future<void> addMovie(Movie movie) async {
    final Uri uri = Uri.parse(baseUrl);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': movie.name,
        'avatar': movie.avatar,
        'description': movie.description,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add movie');
    }
  }

  static Future<void> updateMovie(Movie movie) async {
    final Uri uri = Uri.parse('$baseUrl/${movie.id}');
    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': movie.name,
        'avatar': movie.avatar,
        'description': movie.description,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update movie');
    }
  }

  static Future<void> deleteMovie(String id) async {
    final Uri uri = Uri.parse('$baseUrl/$id');
    final response = await http.delete(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete movie');
    }
  }
}
