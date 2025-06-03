/* 
timer bloc class 
Statemanagement for TimerApp encapsulated here 
reference : 
https://bloclibrary.dev/tutorials/flutter-timer/#timer
*/

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/DataProviders/timer/ticker.dart';

part './timer_event.dart';
part './timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static final int _duration = 60;
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
    : _ticker = ticker,
      super(TimerInitial(_duration)) {
    /*

on<EventType>(void Function<TimerEvent,TimerState>)

Bloc - on method receives a callback function that take two argument 
Typeof Event and typeof State



*/

    on<TimerStarted>(_onStarted);
    on<_TimerTicked>(_onTicked);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  /* 
  @description  : fn that describes the business logic when timer started
                  call Ticker.ticker() so ticker will start the stream 
                  listen to the stream and set the state
                  set the state on timerInitail , emit TimerState
  @args         : EventType event , Emitter<State> handlerFn emit()
  @return       : void
  @author       : karthick.d
   */
  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    // emit the state of type TimerRunInprogress so we can get the duration
    emit(TimerRunInprogress(_duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInprogress(event.duration)
          : TimerRunComplete(),
    );
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    // set the ticker pause by calling tickerSubscription.pause()
    if (state is TimerRunInprogress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(state.duration));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInprogress(state.duration));
    }
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitial(_duration)); // emit always return state object
  }
}
