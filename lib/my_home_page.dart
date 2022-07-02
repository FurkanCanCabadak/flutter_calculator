import 'package:flutter/material.dart';
import 'package:flutter_calculator/result_display.dart';
import 'calc_button.dart';
import 'package:math_expressions/math_expressions.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';
  Color btnColors = Colors.black54;
  Color txtColors = Colors.white;
  // Array of button
  final List<String> buttons = [
    'C',
    '.',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '000',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResultDisplay(
          defaultDisplay: userInput,
        ),
        Expanded(
            child: GridView.builder(
                reverse: true,
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (BuildContext ctx, index) {
                  return CalcButton(
                    buttonText: buttons[index],
                    color: btnColors,
                    textColor: txtColors,
                    buttontapped: () {
                      setState(
                        () {
                          buttonCheck(buttons[index]);
                        },
                      );
                    },
                  );
                }))
      ],
    );
  }

  void buttonCheck(String btnTxt) {
    if (btnTxt == 'C') {
      userInput = '';
      answer = '0';
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
}
