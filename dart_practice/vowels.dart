
import 'dart:io';

void main() {
  print("Введите слово:");

  String word = stdin.readLineSync() ?? "";
  String vowels = "aeiouy";
  int count = 0;

  for (int i = 0; i < word.length; i++) {
    String letter = word[i].toLowerCase();

    if (vowels.contains(letter)) {
      count++;
    }
  }

  print("Слово: $word");
  print("Гласных букв: $count");
}
