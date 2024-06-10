import 'package:get/get.dart';
import 'package:list_item_apps/data/database_helper.dart';
import 'package:list_item_apps/data/movie_favorite_model.dart';
import 'package:list_item_apps/data/movie_model.dart';

class DetailMovieController extends GetxController {
  var movie = Movie(id: '', name: '', avatar: '', description: '').obs;
  var isLoading = true.obs;
  var isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    movie.value = Get.arguments as Movie;
    isLoading.value = false;
    checkFavoriteStatus();
  }

  Future<void> checkFavoriteStatus() async {
    final favorite =
        await DatabaseHelper.instance.getFavoriteById(movie.value.id);
    isFavorite.value = favorite != null;
  }

  Future<void> addFavorite(Movie movie) async {
    final movieFavorite = MovieFavorite(
      id: movie.id,
      name: movie.name,
      avatar: movie.avatar,
      description: movie.description,
    );
    await DatabaseHelper.instance.insertFavorite(movieFavorite);
    isFavorite.value = true;
  }

  Future<void> removeFavorite(String movieId) async {
    await DatabaseHelper.instance.removeFavorite(movieId);
    isFavorite.value = false;
  }
}
