
import 'dart:io';

void main() {
  print("=== Умный калькулятор ===");

  stdout.write("Введите первое число: ");
  double? num1 = double.tryParse(stdin.readLineSync() ?? "");

  stdout.write("Введите второе число: ");
  double? num2 = double.tryParse(stdin.readLineSync() ?? "");

  if (num1 == null || num2 == null) {
    print("Ошибка: введите правильные числа!");
    return;
  }

  stdout.write("Введите оператор (+, -, *, /, %): ");
  String operation = stdin.readLineSync() ?? "";

  double? result;

  if (operation == "+") {
    result = num1 + num2;
  } else if (operation == "-") {
    result = num1 - num2;
  } else if (operation == "*") {
    result = num1 * num2;
  } else if (operation == "/") {
    if (num2 == 0) {
      print("Ошибка: делить на ноль нельзя!");
      return;
    }
    result = num1 / num2;
  } else if (operation == "%") {
    if (num2 == 0) {
      print("Ошибка: делить на ноль нельзя!");
      return;
    }
    result = num1 % num2;
  } else {
    print("Ошибка: неизвестный оператор!");
    return;
  }

  bool isPositive = result >= 0;

  print("======================");
  print("Результат: $result");
  print(isPositive ? "Число положительное или равно нулю" : "Число отрицательное");
  print("Вычисление завершено!");
}
