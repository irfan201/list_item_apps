import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_favorite_controller.dart';

class ListFavoriteView extends GetView<ListFavoriteController> {
  const ListFavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.favorites.isEmpty) {
            return const Center(child: Text('No favorites added.'));
          } else {
            return ListView.builder(
              itemCount: controller.favorites.length,
              itemBuilder: (context, index) {
                final favorite = controller.favorites[index];
                return ListTile(
                  leading: Image.network(
                    favorite.avatar,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(favorite.name),
                  subtitle: Text(favorite.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Remove Favorite',
                        middleText:
                            'Are you sure you want to remove this movie from your favorites?',
                        textCancel: 'Cancel',
                        textConfirm: 'Confirm',
                        onConfirm: () {
                          controller.removeFavorite(favorite.id);
                          Get.back();
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
