import 'dart:async';
import 'package:math_expressions/math_expressions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
      CalculatorEvent event,
      ) async* {
    //BORRAR TODO
    if ( event is ResetAC ) {
      yield* this._resetAC();
      //AGREGAR NUMEROS
    }else if ( event is AddNumber ) {
      yield state.copyWith(
        MathResult: (state.MathResult == '0')
            ? event.number
            : state.MathResult + event.number,
      );
      //BORRAR ULTIMO DIGITO
    }else if( event is DeleteLastNumber){
      yield state.copyWith(
        MathResult : state.MathResult.length > 1
            ? state.MathResult.substring(0, state.MathResult.length - 1)
            : '0'
      );
      //AGREGAR OPERACION
    }else if( event is OperationEntry){
      yield state.copyWith(
        MathResult: (state.MathResult == '')
            ? event.Op
            : state.MathResult + event.Op,
      );
      //CALCULAR RESULTADO
    } else if( event is Result){
      yield* _calculateResult();
    }
  }
  Stream<CalculatorState>_resetAC() async*{
    yield CalculatorState(
        FirstNumber: '0',
        MathResult: '0',
        //SecondNumber: '0',
        Op: ''
    );
  }
  Stream<CalculatorState> _calculateResult() async*{
    String expression = state.MathResult;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try{
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      yield state.copyWith(
        FirstNumber: '${exp.evaluate(EvaluationType.REAL, cm)}'
      );
    }catch(e){
      yield state.copyWith(
          FirstNumber: 'ERROR'
      );
    }
  }
}
