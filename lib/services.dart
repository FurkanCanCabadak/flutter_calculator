import 'package:math_expressions/math_expressions.dart';

var userInput = '';
var answer = '0';
void buttonCheck(String btnTxt) {
  if (btnTxt == 'C') {
  } else if (btnTxt == '%') {
  } else if (btnTxt == 'DEL') {
    userInput = userInput.substring(0, userInput.length - 1);
  } else if (btnTxt == '=') {
    equalPressed();
  } else {
    userInput += btnTxt;
  }
}

// function to calculate the input operation
void equalPressed() {
  String finaluserinput = userInput;
  finaluserinput = userInput.replaceAll('x', '*');

  Parser p = Parser();
  Expression exp = p.parse(finaluserinput);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  answer = eval.toString();
  userInput = answer;
}
