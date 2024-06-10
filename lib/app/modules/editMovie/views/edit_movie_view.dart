import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_item_apps/data/movie_model.dart';
import '../controllers/edit_movie_controller.dart';

class EditMovieView extends StatelessWidget {
  const EditMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = Get.arguments as Movie;
    final controller = Get.put(EditMovieController(movie));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Movie'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: controller.avatarController,
                decoration: const InputDecoration(
                  labelText: 'Avatar URL',
                ),
              ),
              TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.updateMovie,
                child: const Text('Update Movie'),
              ),
              if (controller.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
