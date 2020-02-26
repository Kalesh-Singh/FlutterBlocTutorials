import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/timer/timer_bloc.dart';
import 'package:timer_app/ui/timer/timer_page.dart';

import 'data/ticker.dart';

void main() => runApp(TimerApp());

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      title: 'Timer',
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: TimerPage(),
      ),
    );
  }

}