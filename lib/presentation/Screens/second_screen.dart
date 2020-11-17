import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  final String title;
  final Color color;

  SecondScreen({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
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
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: Text(title + '1'),
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
                    heroTag: Text(title + '2'),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/third',
                  );
                },
                child: Text('3rd Screen'),
              ),
            ],
          );
        },
      ),
    );
  }
}
