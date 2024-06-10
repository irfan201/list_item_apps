import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'movie_favorite_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('favorites.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favorites (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      avatar TEXT NOT NULL,
      description TEXT NOT NULL
    )
    ''');
  }

  Future<void> insertFavorite(MovieFavorite movie) async {
    final db = await instance.database;

    await db.insert(
      'favorites',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavorite(String id) async {
    final db = await instance.database;

    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<MovieFavorite>> getAllFavorites() async {
    final db = await instance.database;

    final maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return MovieFavorite.fromMap(maps[i]);
    });
  }

  Future<MovieFavorite?> getFavoriteById(String id) async {
    final db = await instance.database;

    final maps = await db.query(
      'favorites',
      columns: ['id', 'name', 'avatar', 'description'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return MovieFavorite.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<void> close() async {
    final db = await instance.database;

    db.close();
  }
}
