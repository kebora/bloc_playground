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
}