import 'package:block_statemanagement_demo/bloc/counter_demo/counter_bloc.dart';
import 'package:block_statemanagement_demo/bloc/counter_demo/counter_events.dart';
import 'package:block_statemanagement_demo/bloc/counter_demo/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.count.toString(),
                  style: const TextStyle(fontSize: 60),
                ),
              );
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementCounter()),
                child: const Text("Increment"),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementCounter()),
                child: const Text("Decrement"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
