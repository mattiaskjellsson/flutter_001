class Movie {
  final bool adult;
  final String backdrop_path;
  final List<int> genre_ids;
  final int id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final bool video;
  final num vote_average;
  final num vote_count;

  Movie({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] as bool,
      backdrop_path: json['backdrop_path'] as String,
      genre_ids: List<int>.from(json['genre_ids'].map((x) => x)),
      id: json['id'] as int,
      original_language: json['original_language'] as String,
      original_title: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: json['popularity'] as double,
      poster_path: json['poster_path'] as String,
      release_date: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      vote_average: json['vote_average'] as num,
      vote_count: json['vote_count'] as num,
    );
  }
}
