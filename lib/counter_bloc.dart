import 'dart:async';

enum CounterAction { INCREMENT, DECREMENT, RESET }

class CounterBloc {
  late int counter;
  // pipe
  final _stateStreamController = StreamController<int>();
  // input
  StreamSink<int> get counterSink => _stateStreamController.sink;
  // output
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

// constructor
  CounterBloc() {
    counter = 0;

    // listen change in the stream
    eventStream.listen((event) {
      if (event == CounterAction.INCREMENT) {
        counter++;
      } else if (event == CounterAction.DECREMENT) {
        counter--;
      } else if (event == CounterAction.RESET) {
        counter = 0;
      }

      counterSink.add(counter);
    });
  }
}
