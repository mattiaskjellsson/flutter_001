import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  late final Set<WordPair> _saved;
  late final _biggerFont;
  RandomWords(this._saved, this._biggerFont);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _wordPairs = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  _buildSuggestions() => ListView.builder(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        itemBuilder: (context, idx) {
          if (idx.isOdd) return Divider();

          final index = idx ~/ 2;
          if (index >= _wordPairs.length) {
            _wordPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_wordPairs[index]);
        },
      );

  _buildRow(WordPair wp) {
    final alreadySaved = widget._saved.contains(wp);

    return ListTile(
      title: Text(
        wp.asPascalCase,
        style: widget._biggerFont,
      ),
      trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border_outlined,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          alreadySaved ? widget._saved.remove(wp) : widget._saved.add(wp);
        });
      },
    );
  }
}
