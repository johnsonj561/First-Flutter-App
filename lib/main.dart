import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyFirstApp());

// stateless widgets are immutable - properties can not change
// all values are FINAL
class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

// stateful widgets maintain state that might change during lifetime of widget
// stateful widget requires at least StatefulWidget class that creates instance of State class
// StatefulWidget class is immutable, but the State class persists over lifetime of app

// app logic will reside in here
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Startup Name Generator')),
      body: _buildSuggestions(),
    );
  }
}

// does little, just creates its State class
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
