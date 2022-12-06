import 'dart:async';
import 'counter_event.dart';

class CounterBloc {
  int counterV = 0;

  // Sink - entrada
  final counterStateController = StreamController<int>();
  StreamSink<int> get inCounter => counterStateController.sink;

  // Stream - saída
  Stream<int> get counter => counterStateController.stream;

  final counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => counterEventController.sink;

  CounterBloc() {
    counterEventController.stream.listen((mapEventToState));
  }

  void mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      counterV++;
    } else {
      if(counterV == 0) {
        counterV;
      } else {
        counterV--;
      }
    }


    inCounter.add(counterV);
  }

  //libera o fluxo
  void dispose() {
    counterStateController.close();
    counterEventController.close();
  }
}