/* timer app */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/DataProviders/timer/ticker.dart';
import 'package:newsee/timer/bloc/timer_bloc.dart';
import 'package:newsee/timer/view/timer_view.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: Ticker()),
      child: TimerView(),
    );
  }
}
