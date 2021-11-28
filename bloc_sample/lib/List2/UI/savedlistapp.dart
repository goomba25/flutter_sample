import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedListApp extends StatefulWidget {
  const SavedListApp({Key? key, required this.savedList}) : super(key: key);

  final Set<WordPair> savedList;

  @override
  _SavedListAppState createState() => _SavedListAppState();
}

class _SavedListAppState extends State<SavedListApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved List"),
      ),
      body: _listViewer(),
    );
  }

  Widget _listViewer() {
    return ListView.builder(
      itemCount: widget.savedList.length * 2,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return const Divider();
        }

        var realIndex = index ~/ 2;

        return _listItem(widget.savedList.toList()[realIndex]);
      },
    );
  }

  Widget _listItem(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      onTap: () {
        setState(() {
          widget.savedList.remove(pair);
        });
      },
    );
  }
}
