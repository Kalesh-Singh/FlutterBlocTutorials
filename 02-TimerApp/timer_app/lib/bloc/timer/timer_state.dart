import 'package:equatable/equatable.dart';

/*
Ready — ready to start counting down from the specified duration.
Running — actively counting down from the specified duration.
Paused — paused at some remaining duration.
Finished — completed with a remaining duration of 0.

Each of these states will have an implication on what the user sees.
For example:
  1. If the state is “ready,” the user will be able to start the timer.
  2. If the state is “running,” the user will be able to pause and reset
     the timer as well as see the remaining duration.
  3. If the state is “paused,” the user will be able to resume the timer
     and reset the timer.
  4. If the state is “finished,” the user will be able to reset the timer.
 */

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class Ready extends TimerState {
  const Ready(int duration) : super(duration);

  @override
  String toString() => 'Ready { duration: $duration }';
}

class Paused extends TimerState {
  const Paused(int duration) : super(duration);

  @override
  String toString() => 'Paused { duration: $duration }';
}

class Running extends TimerState {
  const Running(int duration) : super(duration);

  @override
  String toString() => 'Running { duration: $duration }';
}

class Finished extends TimerState {
  const Finished() : super(0);
}
