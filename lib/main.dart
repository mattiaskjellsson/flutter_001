import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'hello.dart';
import 'randomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.deepOrange,
      ),
    );
  }
}

class Home extends StatelessWidget {
  final String title = "Random words";
  final Set<WordPair> _saved = {};
  final TextStyle _biggerFont = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                _pushSaved(context);
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hello(),
            Expanded(child: RandomWords(_saved, _biggerFont)),
          ],
        ),
      ),
    );
  }

  void _pushSaved(context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );

      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];

      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }
}
