part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  final int duration;
  const TimerStarted({required this.duration});
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

final class TimerReset extends TimerEvent {
  const TimerReset();
}

/* _TimerTicked event is being called everytime timer ticks and emit the data */

final class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
