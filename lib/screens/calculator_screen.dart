import 'package:calculator_bloc/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_bloc/widgets/calc_button.dart';
import 'package:calculator_bloc/widgets/results_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            const ResultsLabels(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: 'AC',
                  bgColor: const Color(0xffA5A5A5),
                  onPressed: () => calculatorBloc.add(ResetAC()),
                ),
                CalculatorButton(
                  text: '+/-',
                  bgColor: const Color(0xffA5A5A5),
                  onPressed: () => calculatorBloc.add(ChangeNegativePositive()),
                ),
                CalculatorButton(
                  text: 'del',
                  bgColor: const Color(0xffA5A5A5),
                  onPressed: () => calculatorBloc.add(DeleteLastEntry()),
                ),
                CalculatorButton(
                  text: '/',
                  bgColor: const Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OperationEntry('/')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () => calculatorBloc.add(AddNumber('7')),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => calculatorBloc.add(AddNumber('8')),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => calculatorBloc.add(AddNumber('9')),
                ),
                CalculatorButton(
                  text: 'X',
                  bgColor: const Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OperationEntry('X')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '4',
                  onPressed: () => calculatorBloc.add(AddNumber('4')),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => calculatorBloc.add(AddNumber('5')),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => calculatorBloc.add(AddNumber('6')),
                ),
                CalculatorButton(
                  text: '-',
                  bgColor: const Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OperationEntry('-')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '1',
                  onPressed: () => calculatorBloc.add(AddNumber('1')),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => calculatorBloc.add(AddNumber('2')),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => calculatorBloc.add(AddNumber('3')),
                ),
                CalculatorButton(
                  text: '+',
                  bgColor: const Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(OperationEntry('+')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '0',
                  big: true,
                  onPressed: () => calculatorBloc.add(AddNumber('0')),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => calculatorBloc.add(AddNumber('.')),
                ),
                CalculatorButton(
                  text: '=',
                  bgColor: const Color(0xffF0A23B),
                  onPressed: () => calculatorBloc.add(CalculateResult()),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
