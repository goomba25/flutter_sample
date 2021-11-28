import 'dart:async';

class CountBloc {
  int _count = 0;
  final StreamController<int> _countController =
      StreamController<int>.broadcast();
  Stream<int> get count => _countController.stream;
  int get currentCount => _count;

  add() {
    _count++;
    _countController.sink.add(_count);
  }

  subtraction() {
    _count--;
    _countController.sink.add(_count);
  }

  dispose() {
    _countController.close();
  }
}

var countBloc = CountBloc();
