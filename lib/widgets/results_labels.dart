import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calculator/bloc/calculator/calculator_bloc.dart';

import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class ResultsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            SubResult(text: state.FirstNumber ),
//            SubResult(text: state.Op ),
//            SubResult(text: state.SecondNumber ),
            LineSeparator(),
            MainResultText(text: state.MathResult ),
          ],
        );
      },
    );
  }
}
