import 'dart:async';
import 'package:english_words/english_words.dart';

class SavedBloc {
  Set<WordPair> _savedList = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();

  // Stream<Set<WordPair>> get getSavedListStream() {
  //   return _savedController.stream;
  // }
  Stream<Set<WordPair>> get savedListStream => _savedController.stream;
  Set<WordPair> get currentList => _savedList;

  void savedListEvent(WordPair pair) {
    if (_savedList.contains(pair)) {
      _savedList.remove(pair);
    } else {
      _savedList.add(pair);
    }

    _savedController.add(_savedList);
  }

  dispose() {
    _savedController.close();
  }
}

var savedBloc = SavedBloc();
