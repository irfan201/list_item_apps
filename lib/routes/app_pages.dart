import 'package:get/get.dart';

import '../app/modules/addMovie/bindings/add_movie_binding.dart';
import '../app/modules/addMovie/views/add_movie_view.dart';
import '../app/modules/detailMovie/bindings/detail_movie_binding.dart';
import '../app/modules/detailMovie/views/detail_movie_view.dart';
import '../app/modules/editMovie/bindings/edit_movie_binding.dart';
import '../app/modules/editMovie/views/edit_movie_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/listFavorite/bindings/list_favorite_binding.dart';
import '../app/modules/listFavorite/views/list_favorite_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ADD_MOVIE,
      page: () => const AddMovieView(),
      binding: AddMovieBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MOVIE,
      page: () => const EditMovieView(),
      binding: EditMovieBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MOVIE,
      page: () => const DetailMovieView(),
      binding: DetailMovieBinding(),
    ),
    GetPage(
      name: _Paths.LIST_FAVORITE,
      page: () => const ListFavoriteView(),
      binding: ListFavoriteBinding(),
    ),
  ];
}
