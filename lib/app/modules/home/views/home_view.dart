import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_item_apps/app/modules/home/controllers/home_controller.dart';
import 'package:list_item_apps/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.toNamed(Routes.LIST_FAVORITE);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: controller.movies.length,
            itemBuilder: (context, index) {
              final movie = controller.movies[index];
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: InkWell(
                  onTap: () =>
                      Get.toNamed(Routes.DETAIL_MOVIE, arguments: movie),
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () =>
                            Get.toNamed(Routes.DETAIL_MOVIE, arguments: movie),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                movie.avatar == 'N/A'
                                    ? 'https://via.placeholder.com/300'
                                    : movie.avatar,
                                width: Get.width * 0.3,
                                height: Get.height * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    movie.description,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Get.toNamed(Routes.EDIT_MOVIE,
                                    arguments: movie);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: 'Delete Movie',
                                  middleText:
                                      'Are you sure you want to delete this movie?',
                                  textCancel: 'Cancel',
                                  textConfirm: 'Confirm',
                                  onConfirm: () {
                                    controller.deleteMovie(movie.id);
                                    Get.back();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_MOVIE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
