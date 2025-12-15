import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/presentation/states/bloc/counter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyHomePageBloc extends StatelessWidget {
  final String title;

  const MyHomePageBloc({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) {
        final bloc = GetIt.I.get<CounterBloc>();
        bloc.add(InitCounterEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              BlocSelector<CounterBloc, CounterState, int>(
                selector: (state) {
                  if (state case final CounterLoaded currentState) {
                    return currentState.value;
                  }
                  return 0;
                },
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (builderContext) {
            return FloatingActionButton(
              onPressed: () => builderContext.read<CounterBloc>().add(AddCounterEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }
}
