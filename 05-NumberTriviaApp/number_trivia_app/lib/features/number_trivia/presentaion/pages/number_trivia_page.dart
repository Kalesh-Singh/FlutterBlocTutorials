import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbertriviaapp/features/number_trivia/presentaion/bloc/number_trivia_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                // Top Half
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Placeholder(),
                ),
                SizedBox(height: 20),
                // Bottom Half
                Column(
                  children: <Widget>[
                    // TextField
                    Placeholder(fallbackHeight: 40),
                    SizedBox(height: 10),
                    // Buttons
                    Row(
                      children: <Widget>[
                        Expanded(child: Placeholder(fallbackHeight: 30)),
                        SizedBox(width: 10),
                        Expanded(child: Placeholder(fallbackHeight: 30)),
                      ],
                    ),
                  ],
                ),
                // Bottom Half
              ],
            ),
          ),
      ),
    );
  }
}
