import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/presentation/states/cubit/counter_cubit.dart';
import 'package:get_it/get_it.dart';

class MyHomePageCubit extends StatelessWidget {
  final String title;

  const MyHomePageCubit({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) =>
      GetIt.I.get()
        ..init(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: <Widget>[
            const Text('You have pushed the button this many times:'),
        // BlocBuilder<CounterCubit, CounterState>(
        //   builder: (context, state) {
        //     return switch (state) {
        //       CounterLoaded(value: final counter) => Text(
        //         '$counter',
        //         style: Theme.of(context).textTheme.headlineMedium,
        //       ),
        //       CounterLoading() => CircularProgressIndicator(),
        //       CounterError() => Text('Error'),
        //       _ => Text('Unknown state'),
        //     };
        //     // switch (state) {
        //     //   case CounterLoaded(value: final counter):
        //     //     return Text(
        //     //       '$counter',
        //     //       style: Theme.of(context).textTheme.headlineMedium,
        //     //     );
        //     //   case CounterLoading():
        //     //     return CircularProgressIndicator();
        //     //   case CounterError():
        //     //     return Text('Error');
        //     //   default:
        //     //     return Text('Unknown state');
        //     // }
        //   },
        // ),
        BlocSelector<CounterCubit, CounterState, int>(
          selector: (state) {
            if (state case final CounterLoaded currentState) {
              return currentState.value;
            }
            return 0;
          },
          builder: (context, counter) {
            return Text(
              '$counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            );
          },
        ),
        Builder(
          builder: (builderContext) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 16,
              children: [
                FloatingActionButton(
                  onPressed: builderContext
                      .read<CounterCubit>()
                      .subtract,
                  tooltip: 'Increment',
                  child: const Icon(Icons.exposure_minus_1),
                ),
                FloatingActionButton(
                  onPressed: builderContext
                      .read<CounterCubit>()
                      .add,
                  tooltip: 'Increment',
                  child: const Icon(Icons.exposure_plus_1),
                ),
              ],
            );
          },
        )
        ],
      ),
    ),);
  }
}
