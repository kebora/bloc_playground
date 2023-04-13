import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent{}

class CounterIncrementEvent extends CounterEvent{
  CounterIncrementEvent();
}

class CounterDecrementEvent extends CounterEvent{
  CounterDecrementEvent();
}

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc():super(0){
    on<CounterIncrementEvent>((event, emit){
      emit(state+1);
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(state-1);
    });
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    // log("The change is:: $change");
    super.onChange(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    // TODO: implement onTransition
    // log("The transition is:: ${transition}");
    super.onTransition(transition);
  }

  @override
  void onEvent(CounterEvent event) {
    // TODO: implement onEvent
    // log("The event is:: ${event}");
    super.onEvent(event);
  }
}