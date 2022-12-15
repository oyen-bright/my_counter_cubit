import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubit/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'My Counter Application ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${BlocProvider.of<CounterCubit>(context, listen: true).state.count}',
              style: const TextStyle(fontSize: 52.0),
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.count == 12) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const AlertDialog(content: Text("Hello block"));
                      });
                }
              },
              builder: (context, state) {
                return Text(state.count.toString(),
                    style: const TextStyle(fontSize: 52.0));
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increaseCounter();
            },
            heroTag: "increment",
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decreaseCounter();
            },
            heroTag: "decrement",
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().mulCounter();
            },
            heroTag: "muiltiplication",
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
