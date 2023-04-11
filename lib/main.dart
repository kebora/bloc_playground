import 'dart:developer';

import 'package:bloc_playground/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //MultiBlocProvider
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => SwitchCubit(),
          ),
        ],
        child: const MyAppView(),
      ),
    );
  }
}
//BlocProvider

//BlocBuilder
class MyAppView extends StatelessWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Calling the build function");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit basic example"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<CounterBloc>().add(CounterIncrementEvent()),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Number increments on button click!"),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                log("Only the text is rebuilt!");
                return Text("${context
                    .read<CounterBloc>()
                    .state}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 45),);
              },
            ),
            BlocBuilder<SwitchCubit, bool>(
              builder: (context, state) {
                log("Switch is currently: $state");
                return Switch(value:state,
                    onChanged: (value)=>context.read<SwitchCubit>().flipSwitch());
              },
            )
          ],
        ),
      ),
    );
  }
}


