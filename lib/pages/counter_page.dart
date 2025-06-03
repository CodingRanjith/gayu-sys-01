/* counter page */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Made with Bloc')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, count) {
          return Center(
            child: Text("${count.count}", style: TextStyle(fontSize: 24.0)),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed:
                  () => context.read<CounterBloc>().add(
                    CounterIncrementPressed(),
                  ),
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed:
                  () => context.read<CounterBloc>().add(
                    CounterDecrementPressed(),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
