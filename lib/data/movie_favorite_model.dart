class MovieFavorite {
  final String id;
  final String name;
  final String avatar;
  final String description;

  MovieFavorite({
    required this.id,
    required this.name,
    required this.avatar,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'description': description,
    };
  }

  static MovieFavorite fromMap(Map<String, dynamic> map) {
    return MovieFavorite(
      id: map['id'],
      name: map['name'],
      avatar: map['avatar'],
      description: map['description'],
    );
  }
}
