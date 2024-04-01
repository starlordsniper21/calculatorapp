import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = '';
    } else if (buttonText == '=') {
      num2 = double.parse(_output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {
      _output;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Ni Lor'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(
            height: 10.0,
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('C'),
                  buildButton('0'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
