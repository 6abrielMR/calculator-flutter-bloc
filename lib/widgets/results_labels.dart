import 'package:calculator_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_bloc/widgets/line_separator.dart';
import 'package:calculator_bloc/widgets/main_result.dart';
import 'package:calculator_bloc/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsLabels extends StatelessWidget {
  const ResultsLabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            SubResult(text: state.firstNumber),
            SubResult(text: state.operation),
            SubResult(
                text: state.secondNumber.endsWith('.0')
                    ? state.secondNumber
                        .substring(0, state.secondNumber.length - 2)
                    : state.secondNumber),
            const LineSeparator(),
            MainResultText(
                text: state.mathResult.endsWith('.0')
                    ? state.mathResult.substring(0, state.mathResult.length - 2)
                    : state.mathResult),
          ],
        );
      },
    );
  }
}
