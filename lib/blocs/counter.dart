import 'dart:async';
import 'dart:developer';

class CounterBloc {
  int _counter = 0;

  int get initCounter => _counter;

  final StreamController _inputController = StreamController();
  StreamSink get input => _inputController.sink;

  final StreamController _outputController = StreamController();
  StreamSink get sinkOutput => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      if (event == "add" && _counter < 0) {
        _counter = 1;
      } else if (event == "add") {
        _counter++;
      } else {
        _counter--;
      }

      sinkOutput.add(_counter);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
