/* CounterBloc */
import 'package:bloc/bloc.dart';

class CounterState {
  final int count;
  CounterState(this.count);
}

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementPressed>(
      (event, emit) => emit(CounterState(state.count + 1)),
    );
    on<CounterDecrementPressed>(
      (event, emit) => emit(CounterState(state.count - 1)),
    );
  }
}
