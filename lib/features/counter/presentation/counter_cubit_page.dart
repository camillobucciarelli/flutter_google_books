import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'states/cubit/counter_cubit.dart';

class CounterCubitPage extends StatelessWidget {
  final String title;

  const CounterCubitPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => GetIt.I.get()..init(),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme
        //       .of(context)
        //       .colorScheme
        //       .inversePrimary,
        //   title: Text(title),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
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
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Builder(
              builder: (builderContext) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 16,
                  children: [
                    ExcludeSemantics(
                      child: IconButton.filled(
                        onPressed: builderContext.read<CounterCubit>().subtract,
                        tooltip: 'Decreament',
                        icon: const Icon(Icons.exposure_minus_1),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: builderContext.read<CounterCubit>().add,
                      tooltip: 'Increment',
                      icon: const Icon(Icons.exposure_plus_1),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
