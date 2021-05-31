import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> wordPairs = <WordPair>[];
  final TextStyle biggerFont = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  _buildSuggestions() => ListView.builder(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        itemBuilder: (context, idx) {
          if (idx.isOdd)
            return Divider(
              height: 1,
              thickness: 1,
              color: Colors.deepOrange,
            );

          final index = idx ~/ 2;
          if (index >= wordPairs.length) {
            wordPairs.addAll(generateWordPairs().take(10));
          }

          return _buildRow(wordPairs[index]);
        },
      );

  _buildRow(WordPair wp) {
    return ListTile(
      title: Text(
        wp.asPascalCase,
        style: biggerFont,
      ),
    );
  }
}
