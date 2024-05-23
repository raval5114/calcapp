import 'dart:io';

void main() {
  //var myList = [''];
  print("Enter Expression");
  var s = stdin.readLineSync();
  var expression = s;
  var parser = MyParser();
  var result = parser.parse(expression!).toString();
  print('Result: $result');
  print(result.runtimeType);
}

class MyParser {
  static const _operators = {'+', '-', '*', '/'};

  double parse(String expression) {
    return _parseExpression(expression.replaceAll(' ', ''));
  }

  double _parseExpression(String expression) {
    var currentTerm = '';
    var accumulator = 0.0;
    var operator = '+';

    for (var i = 0; i < expression.length; i++) {
      final char = expression[i];
      if (_operators.contains(char)) {
        accumulator =
            _applyOperator(accumulator, operator, double.parse(currentTerm));
        currentTerm = '';
        operator = char;
      } else {
        currentTerm += char;
      }
    }

    // Process the last term
    accumulator =
        _applyOperator(accumulator, operator, double.parse(currentTerm));
    return accumulator;
  }

  double _applyOperator(double a, String operator, double b) {
    switch (operator) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        if (b == 0) {
          throw Exception('Division by zero');
        }
        return a / b;
      default:
        throw Exception('Invalid operator');
    }
  }
}
