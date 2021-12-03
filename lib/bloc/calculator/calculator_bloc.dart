import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<CalculatorEvent>((event, emit) async {
      if (event is ResetAC) {
        emit(_resetAC());
      } else if (event is AddNumber) {
        String _currentNumber = state.mathResult + event.number;

        if (state.mathResult == '0' && event.number != '.') {
          _currentNumber = event.number;
        } else if (_currentNumber.endsWith('..')) {
          _currentNumber = state.mathResult;
        }

        emit(state.copiWith(mathResult: _currentNumber));
      } else if (event is ChangeNegativePositive) {
        emit(state.copiWith(
            mathResult: (state.mathResult.contains('-'))
                ? state.mathResult.replaceFirst('-', '')
                : '-' + state.mathResult));
      } else if (event is DeleteLastEntry) {
        emit(state.copiWith(
            mathResult: (state.mathResult.length > 1)
                ? state.mathResult.substring(0, state.mathResult.length - 1)
                : '0'));
      } else if (event is OperationEntry) {
        emit(state.copiWith(
            firstNumber: state.mathResult,
            mathResult: '0',
            operation: event.operation,
            secondNumber: '0'));
      } else if (event is CalculateResult) {
        emit(_calculateResult());
      }
    });
  }

  CalculatorState _resetAC() => CalculatorState(
      firstNumber: '0', mathResult: '0', secondNumber: '0', operation: '+');

  CalculatorState _calculateResult() {
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    switch (state.operation) {
      case '+':
        return state.copiWith(
            secondNumber: state.mathResult, mathResult: '${num1 + num2}');
      case '-':
        return state.copiWith(
            secondNumber: state.mathResult, mathResult: '${num1 - num2}');
      case 'X':
        return state.copiWith(
            secondNumber: state.mathResult, mathResult: '${num1 * num2}');
      case '/':
        return state.copiWith(
            secondNumber: state.mathResult, mathResult: '${num1 / num2}');
      default:
        return state;
    }
  }
}
