import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../Bloc/savedbloc.dart';

class SavedListApp extends StatefulWidget {
  const SavedListApp({Key? key}) : super(key: key);

  @override
  _SavedListAppState createState() => _SavedListAppState();
}

class _SavedListAppState extends State<SavedListApp> {
  @override
  void initState() {
    super.initState();
    savedBloc.savedListStream.asBroadcastStream();
  }

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
    return StreamBuilder<Set<WordPair>>(
      stream: savedBloc.savedListStream,
      initialData: savedBloc.currentList,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length * 2,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              return const Divider();
            }

            var realIndex = index ~/ 2;

            return _listItem(snapshot.data!.toList()[realIndex]);
          },
        );
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
        savedBloc.savedListEvent(pair);
      },
    );
  }
}
