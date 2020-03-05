import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numbertriviaapp/features/number_trivia/presentaion/bloc/number_trivia_bloc.dart';
import 'package:numbertriviaapp/features/number_trivia/presentaion/bloc/number_trivia_state.dart';
import 'package:numbertriviaapp/features/number_trivia/presentaion/widgets/loading_widget.dart';
import 'package:numbertriviaapp/features/number_trivia/presentaion/widgets/message_display.dart';
import 'package:numbertriviaapp/features/number_trivia/presentaion/widgets/trivia_display.dart';

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
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (BuildContext context, state) {
                  if (state is TriviaEmpty) {
                    return MessageDisplay(message: 'Start searching!');
                  } else if (state is TriviaLoadInProgress) {
                    return LoadingWidget();
                  } else if (state is TriviaLoadSuccess) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  } else if (state is TriviaLoadFailure) {
                    return MessageDisplay(message: state.message);
                  }
                },
              ),
              SizedBox(height: 20),
              // Bottom Half
              TriviaControls(),
              // Bottom Half
            ],
          ),
        ),
      ),
    );
  }
}

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
        ),
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
    );
  }
}
