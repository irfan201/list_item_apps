class Movie {
  final String name;
  final String avatar;
  final String description;
  final String id;

  Movie({
    required this.name,
    required this.avatar,
    required this.description,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'],
      avatar: json['avatar'],
      description: json['description'],
      id: json['id'],
    );
  }
}
