import 'dart:async';

class CounterBloc {
  // pipe
  final _stateStreamController = StreamController<int>();

  // input
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // output
  Stream<int> get counterStream => _stateStreamController.stream;
}
