
class PasswordValidator {
  static const int minLength = 8;
  static const String requirement = "Пароль должен содержать цифру";

  static bool validate(String password) {
    bool hasEnoughCharacters = password.length >= minLength;
    bool hasDigit = RegExp(r'\d').hasMatch(password);

    return hasEnoughCharacters && hasDigit;
  }
}

void main() {
  String password1 = "hello123";
  String password2 = "hello";
  String password3 = "12345678";

  print("Пароль: $password1");
  print("Результат: ${PasswordValidator.validate(password1)}");

  print("Пароль: $password2");
  print("Результат: ${PasswordValidator.validate(password2)}");

  print("Пароль: $password3");
  print("Результат: ${PasswordValidator.validate(password3)}");
}
