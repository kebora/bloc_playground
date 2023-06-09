import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit():super(0);
  //BlocBase
  void increment()=>emit(state+1);
}

class SwitchCubit extends Cubit<bool>{
  SwitchCubit():super(false);

  void flipSwitch()=>emit(!state);
}