
import 'dart:math';

class MathProcessor {
  List<double> numbers;

  MathProcessor(this.numbers);

  List<double> process(double Function(double) operation) {
    return numbers.map(operation).toList();
  }

  static List<double> getRandomNumbers(int count) {
    Random random = Random();

    return List.generate(
      count,
      (index) => random.nextDouble() * 100,
    );
  }
}

void main() {
  MathProcessor processor = MathProcessor([1, 2, 3, 4, 5]);

  print("Исходные числа:");
  print(processor.numbers);

  print("Числа в квадрате:");
  print(processor.process((number) => number * number));

  print("Случайные числа:");
  print(MathProcessor.getRandomNumbers(5));
}
