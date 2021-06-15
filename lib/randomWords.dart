import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;

import './models/movie.dart';
import './models/moviesPage.dart';

class RandomWords extends StatefulWidget {
  late final Set<WordPair> _saved;
  late final _biggerFont;
  RandomWords(this._saved, this._biggerFont);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<Movie> _movies = <Movie>[];
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMovies();
  }

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildMovies() {
    return Column(
      children: [
        Expanded(
            child: NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    return _buildRow(_movies[index]);
                  },
                ),
                onNotification: (ScrollNotification notification) {
                  if (!_isLoading &&
                      notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {
                    _getMovies();
                  }

                  return true;
                })),
      ],
    );
  }

  _buildRow(Movie movie) {
    return ListTile(
      title: Text(movie.title),
      leading: Image.network(
        'https://image.tmdb.org/t/p/w200${movie.poster_path}',
        cacheWidth: 200,
      ),
      subtitle: Text(movie.overview),
      trailing: Text('${movie.vote_average}'),
    );
  }

  Future _getMovies() async {
    _isLoading = true;
    final url =
        'https://api.themoviedb.org/3/discover/movie?api_key=74eb0ca644c90551bacaf3a1aa9cfa37&language=en-US&page=${_page++}';
    final result = await http.get(Uri.parse(url));
    final movies = MoviesPage.fromJson(jsonDecode(result.body)).results;
    setState(() {
      _movies.addAll(movies);
      _isLoading = false;
    });
  }
}
