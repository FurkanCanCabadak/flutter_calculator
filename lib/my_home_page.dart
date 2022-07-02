import 'package:flutter/material.dart';
import 'package:flutter_calculator/result_display.dart';
import 'package:flutter_calculator/services.dart';
import 'calc_button.dart';

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
}
