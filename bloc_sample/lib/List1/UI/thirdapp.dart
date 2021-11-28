import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './savedlistapp.dart';
import '../Bloc/savedbloc.dart';

class ThirdApp extends StatefulWidget {
  const ThirdApp({Key? key}) : super(key: key);

  @override
  _ThirdAppState createState() => _ThirdAppState();
}

class _ThirdAppState extends State<ThirdApp> {
  final List<WordPair> _wordList = <WordPair>[];

  @override
  void dispose() {
    super.dispose();
    savedBloc.dispose();
  }

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
                      builder: (context) => const SavedListApp(),
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
    return StreamBuilder<Set<WordPair>>(
      stream: savedBloc.savedListStream,
      builder: (context, snapshot) {
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return const Divider();
            }

            var realIndex = index ~/ 2;

            if (realIndex >= _wordList.length) {
              _wordList.addAll(generateWordPairs().take(10));
            }

            return _listItem(snapshot.data, _wordList[realIndex]);
          },
        );
      },
    );
  }

  Widget _listItem(Set<WordPair>? saved, WordPair pair) {
    final bool isChecked = (saved == null ? false : saved.contains(pair));

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
        savedBloc.savedListEvent(pair);
      },
    );
  }
}
