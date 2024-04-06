import 'package:math_expressions/math_expressions.dart';

class MyHelper {
  /// Hàm tính toán
  static String calculate(String input) {
    try {
      var exp = Parser().parse(input);
      var eveluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return eveluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  ///
}
