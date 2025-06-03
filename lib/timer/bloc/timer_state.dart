/* 
class TimerState that set timerstate instance duration for different action 
it extends Equatable class so to avoid rebuild if state is same as previousState

sealed class TimeState extends Equatable {

  final int duration;

  const TimerState(this.duration)


} 
 */

part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object?> get props => [duration];
}

//   this class set the set the initial time when Timer is started

class TimerInitial extends TimerState {
  TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

//   this class set the set the TimeState duration when Timer is running

class TimerRunPause extends TimerState {
  TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

//   this class set the set the TimeState duration when Timer is paused

class TimerRunInprogress extends TimerState {
  TimerRunInprogress(super.duration);

  @override
  String toString() => 'TimerRunInprogress { duration: $duration }';
}

//   this class set the set the TimeState duration when Timer is completed

class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(0);

  @override
  String toString() => 'TimerRunComplete { duration: $duration }';
}
