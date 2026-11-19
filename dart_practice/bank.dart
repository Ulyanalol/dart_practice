
import 'dart:math';

// Класс банковского счёта
class BankAccount {
  String accountNumber;
  double balance = 0;
  String ownerName;

  BankAccount(this.accountNumber, this.ownerName);

  // Пополнение счёта
  bool deposit(double amount) {
    if (amount <= 0) {
      print("Ошибка: сумма должна быть положительной!");
      return false;
    }

    balance += amount;
    print("Счёт пополнен на $amount");
    return true;
  }

  // Снятие денег
  bool withdraw(double amount) {
    if (amount <= 0) {
      print("Ошибка: сумма должна быть положительной!");
      return false;
    }

    if (amount > balance) {
      print("Ошибка: недостаточно денег!");
      return false;
    }

    balance -= amount;
    print("Снято $amount");
    return true;
  }

  // Показать баланс
  void displayBalance() {
    print("Владелец: $ownerName");
    print("Номер счёта: $accountNumber");
    print("Баланс: $balance");
  }
}

// Класс банка
class Bank {
  List<BankAccount> accounts = [];
  Random random = Random();

  // Создание случайного номера из 10 цифр
  String generateAccountNumber() {
    String number = (random.nextInt(9) + 1).toString();

    for (int i = 0; i < 9; i++) {
      number += random.nextInt(10).toString();
    }

    return number;
  }

  // Создание нового счёта
  BankAccount addAccount(String ownerName) {
    String number;

    do {
      number = generateAccountNumber();
    } while (findAccount(number) != null);

    BankAccount account = BankAccount(number, ownerName);
    accounts.add(account);

    print("Создан счёт для $ownerName");
    return account;
  }

  // Поиск счёта
  BankAccount? findAccount(String accountNumber) {
    for (var account in accounts) {
      if (account.accountNumber == accountNumber) {
        return account;
      }
    }

    return null;
  }

  // Перевод денег между счетами
  bool transfer(
      String fromAccountNumber,
      String toAccountNumber,
      double amount) {

    BankAccount? from = findAccount(fromAccountNumber);
    BankAccount? to = findAccount(toAccountNumber);

    if (from == null || to == null) {
      print("Ошибка: счёт не найден!");
      return false;
    }

    if (amount <= 0) {
      print("Ошибка: сумма должна быть положительной!");
      return false;
    }

    if (from.balance < amount) {
      print("Ошибка: недостаточно денег для перевода!");
      return false;
    }

    from.withdraw(amount);
    to.deposit(amount);

    print("Перевод успешно выполнен!");
    return true;
  }
}

void main() {
  Bank bank = Bank();

  // Создаём два счёта
  BankAccount account1 = bank.addAccount("Марго");
  BankAccount account2 = bank.addAccount("Анна");

  print("\nПополнение счёта:");
  account1.deposit(1000);

  print("\nПеревод денег:");
  bank.transfer(
    account1.accountNumber,
    account2.accountNumber,
    300,
  );

  print("\nБаланс первого счёта:");
  account1.displayBalance();

  print("\nБаланс второго счёта:");
  account2.displayBalance();

  print("\nСписок всех счетов:");
  print(bank.accounts.length);
}
