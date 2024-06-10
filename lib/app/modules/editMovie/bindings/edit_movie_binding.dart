import 'package:get/get.dart';
import 'package:list_item_apps/data/movie_model.dart';
import '../controllers/edit_movie_controller.dart';


class EditMovieBinding extends Bindings {
  @override
  void dependencies() {
    final Movie movie = Get.arguments;
    Get.lazyPut<EditMovieController>(
      () => EditMovieController(movie),
    );
  }
}
