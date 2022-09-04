part of 'calculator_bloc.dart';

class CalculatorState {
  final String MathResult;
  final String FirstNumber;
  //final String SecondNumber;
  final String Op;
  CalculatorState({
    this.MathResult ='0',
    this.FirstNumber = '20',
  //  this.SecondNumber = '30',
    this.Op = '+'
  });
  CalculatorState copyWith({
    String? MathResult,
    String? FirstNumber,
    //String? SecondNumber,
    String? Op,
  }) => CalculatorState(
    MathResult: MathResult ?? this.MathResult,
    FirstNumber: FirstNumber ?? this.FirstNumber,
    //SecondNumber: SecondNumber ?? this.SecondNumber,
    Op: Op ?? this.Op,
  );
}


