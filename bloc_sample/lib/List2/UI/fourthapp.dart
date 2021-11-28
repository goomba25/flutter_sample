import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './savedlistapp.dart';

class FourthApp extends StatefulWidget {
  const FourthApp({Key? key}) : super(key: key);

  @override
  _ThirdAppState createState() => _ThirdAppState();
}

class _ThirdAppState extends State<FourthApp> {
  final List<WordPair> _wordList = <WordPair>[];
  final Set<WordPair> _savedList = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Sample"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => SavedListApp(
                        savedList: _savedList,
                      ),
                    ),
                  )
                  .then(
                    (_) => setState(() {}),
                  );
            },
          ),
        ],
      ),
      body: _listViewer(),
    );
  }

  Widget _listViewer() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return const Divider();
        }

        var realIndex = index ~/ 2;

        if (realIndex >= _wordList.length) {
          _wordList.addAll(generateWordPairs().take(10));
        }

        return _listItem(_wordList[realIndex]);
      },
    );
  }

  Widget _listItem(WordPair pair) {
    final bool isChecked = _savedList.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        isChecked ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        setState(() {
          if (isChecked) {
            _savedList.remove(pair);
          } else {
            _savedList.add(pair);
          }

          print(_savedList.toString());
        });
      },
    );
  }
}
