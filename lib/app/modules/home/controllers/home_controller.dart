import 'package:get/get.dart';
import 'package:list_item_apps/api/movie_api.dart';
import 'package:list_item_apps/data/movie_model.dart';

class HomeController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var fetchedMovies = await MovieApi.getMovies();
      movies.assignAll(fetchedMovies);
      errorMessage('');
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void deleteMovie(String id) async {
    try {
      await MovieApi.deleteMovie(id);
      movies.removeWhere((movie) => movie.id == id);
    } catch (e) {
      errorMessage(e.toString());
    }
  }
}
