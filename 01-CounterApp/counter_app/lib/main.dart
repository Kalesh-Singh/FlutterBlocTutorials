import 'package:counter_app/blocs/counter/counter_bloc.dart';
import 'package:counter_app/pages/counter/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Counter App',
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      )
    );
  }
}