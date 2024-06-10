import 'package:get/get.dart';
import 'package:list_item_apps/data/database_helper.dart';
import 'package:list_item_apps/data/movie_favorite_model.dart';

class ListFavoriteController extends GetxController {
  var favorites = <MovieFavorite>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    isLoading.value = true;
    final dbFavorites = await DatabaseHelper.instance.getAllFavorites();
    favorites.value = dbFavorites;
    isLoading.value = false;
  }

  Future<void> removeFavorite(String id) async {
    await DatabaseHelper.instance.removeFavorite(id);
    await loadFavorites();
  }
}
