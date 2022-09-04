part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent{}

class AddNumber extends CalculatorEvent{
  final String number;
  AddNumber(this.number);
}

class DeleteLastNumber extends CalculatorEvent{}

class OperationEntry extends CalculatorEvent{
  final String Op;
  OperationEntry(this.Op);
}
class Result extends CalculatorEvent {}