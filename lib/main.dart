import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);
  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: MaterialApp(
          title: 'Bloc Demo',
          home: HomeScreen(),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bloc Demo'),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
          if (state.wasIncremented == true) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 100),
                content: Text('Incremented'),
              ),
            );
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 100),
                content: Text('Decremented'),
              ),
            );
          }
        }, builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(state.counterValue.toString());
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  )
                ],
              ),
            ],
          );
        }));
  }
}
