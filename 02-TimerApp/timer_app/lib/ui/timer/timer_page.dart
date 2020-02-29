import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/timer/timer_bloc.dart';
import 'package:timer_app/bloc/timer/timer_state.dart';
import 'package:timer_app/ui/timer/widgets/actions.dart';

import 'widgets/waves_background.dart';

class TimerPage extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Timer')),
        body: Stack(children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                  final String minutesStr =
                      (state.duration ~/ 60).toString().padLeft(2, '0');
                  final String secondsStr =
                      (state.duration % 60).toString().padLeft(2, '0');
                  return Text(
                    '$minutesStr:$secondsStr',
                    style: TimerPage.timerTextStyle,
                  );
                })),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                // We don't want the buttons to be rebuilt on every Tick
                condition: (previousState, state) =>
                    state.runtimeType != previousState.runtimeType,
                builder: (context, state) => TimerActions(),
              ),
            ],
          ),
        ]));
  }
}
