import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_item_apps/api/movie_api.dart';
import 'package:list_item_apps/data/movie_model.dart';

class EditMovieController extends GetxController {
  final Movie movie;

  EditMovieController(this.movie);

  final nameController = TextEditingController();
  final avatarController = TextEditingController();
  final descriptionController = TextEditingController();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.text = movie.name;
    avatarController.text = movie.avatar;
    descriptionController.text = movie.description;
  }

  Future<void> updateMovie() async {
    if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
      errorMessage('Please fill all fields');
      return;
    }

    try {
      isLoading(true);
      final updatedMovie = Movie(
        id: movie.id,
        name: nameController.text,
        avatar: avatarController.text,
        description: descriptionController.text,
      );
      await MovieApi.updateMovie(updatedMovie);
      Get.back(result: true);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    avatarController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
