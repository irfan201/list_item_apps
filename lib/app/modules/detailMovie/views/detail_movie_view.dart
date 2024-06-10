import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_movie_controller.dart';

class DetailMovieView extends GetView<DetailMovieController> {
  const DetailMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final movie = controller.movie.value;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      movie.avatar,
                      width: Get.width * 0.6,
                      height: Get.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        final bool isFavorite = controller.isFavorite.value;
                        if (isFavorite) {
                          await controller.removeFavorite(movie.id);
                          Get.snackbar(
                              'Success', 'Movie removed from favorites');
                        } else {
                          await controller.addFavorite(movie);
                          Get.snackbar('Success', 'Movie added to favorites');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isFavorite.value
                            ? Colors.red
                            : Colors.grey,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.6, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Favorite',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
