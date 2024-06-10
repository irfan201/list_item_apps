import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_movie_controller.dart';

class AddMovieView extends GetView<AddMovieController> {
  const AddMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Movie'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                  onPressed: controller.addMovie,
                  child: const Text('Add Movie'),
                );
              }
            }),
            Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}
