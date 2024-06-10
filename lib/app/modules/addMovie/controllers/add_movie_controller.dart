// add_movie_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_item_apps/api/movie_api.dart';
import 'package:list_item_apps/data/movie_model.dart';

class AddMovieController extends GetxController {
  final nameController = TextEditingController();
  final avatarController = TextEditingController();
  final descriptionController = TextEditingController();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onClose() {
    nameController.dispose();
    avatarController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  Future<void> addMovie() async {
    if (nameController.text.isEmpty || avatarController.text.isEmpty || descriptionController.text.isEmpty) {
      errorMessage('Please fill all fields');
      return;
    }

    isLoading(true);
    try {
      final newMovie = Movie(
        name: nameController.text,
        avatar: avatarController.text,
        description: descriptionController.text,
        id: '',
      );

      await MovieApi.addMovie(newMovie);
      Get.snackbar('Success', 'Movie added successfully');
      Get.back();
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
