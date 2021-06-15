import './movie.dart';

class MoviesPage {
  final int page;
  final List<Movie> results;
  final int total_pages;
  final int total_results;

  MoviesPage({
    required this.page,
    required this.results,
    required this.total_pages,
    required this.total_results,
  });

  factory MoviesPage.fromJson(Map<String, dynamic> json) {
    return MoviesPage(
      page: json['page'] as int,
      results: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
      total_pages: json['total_pages'] as int,
      total_results: json['total_results'] as int,
    );
  }
}
