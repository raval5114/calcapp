import 'package:math_expressions/math_expressions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:calcapp/Model/string_gen.dart';

part 'resultProvider.g.dart';

@riverpod
class result extends _$result {
  final parser = MyParser();
  @override
  String build() {
    return " ";
  }

  void eval(String s) {
    Parser p = Parser();
    Expression exp = p.parse(s);
    ContextModel cm = ContextModel();
    state = exp.evaluate(EvaluationType.REAL, cm).toString();
  }

  void clearString() {
    state = " ";
  }
}
