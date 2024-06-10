part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const ADD_MOVIE = _Paths.ADD_MOVIE;
  static const EDIT_MOVIE = _Paths.EDIT_MOVIE;
  static const DETAIL_MOVIE = _Paths.DETAIL_MOVIE;
  static const LIST_FAVORITE = _Paths.LIST_FAVORITE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ADD_MOVIE = '/add-movie';
  static const EDIT_MOVIE = '/edit-movie';
  static const DETAIL_MOVIE = '/detail-movie';
  static const LIST_FAVORITE = '/list-favorite';
}
