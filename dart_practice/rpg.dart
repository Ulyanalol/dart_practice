
import 'dart:math';

// Абстрактный класс персонажа
abstract class Character {
  String name;
  int health = 100;
  int level = 1;

  Character(this.name);

  int attack();
  void defend(int damage);

  bool isAlive() {
    return health > 0;
  }

  void showStatus() {
    print("$name — здоровье: $health HP");
  }
}

// Байонетта
class Bayonetta extends Character {
  Bayonetta(String name) : super(name);

  @override
  int attack() {
    int damage = 15 + level * 2;
    print("$name атакует и наносит $damage урона!");
    return damage;
  }

  @override
  void defend(int damage) {
    int reducedDamage = (damage * 0.8).round();
    health -= reducedDamage;
    print("$name получает $reducedDamage урона после защиты!");
  }
}

// Барбара
class Barbara extends Character {
  Barbara(String name) : super(name);

  @override
  int attack() {
    int damage = 10 + level * 3;

    health = min(100, health + 5);

    print("$name атакует и наносит $damage урона!");
    print("$name восстанавливает 5 HP!");

    return damage;
  }

  @override
  void defend(int damage) {
    health -= damage;
    print("$name получает $damage урона!");
  }
}

// Данте
class Dante extends Character {
  final Random random = Random();

  Dante(String name) : super(name);

  @override
  int attack() {
    int damage = 20;

    if (random.nextInt(100) < 20) {
      damage *= 3;
      print("$name наносит КРИТИЧЕСКИЙ УДАР!");
    }

    print("$name атакует и наносит $damage урона!");
    return damage;
  }

  @override
  void defend(int damage) {
    if (random.nextBool()) {
      print("$name увернулся от атаки!");
    } else {
      health -= damage;
      print("$name получает $damage урона!");
    }
  }
}

// Сражение между персонажами
void battle(Character first, Character second) {
  print("\n=== НАЧАЛО БОЯ ===");

  while (first.isAlive() && second.isAlive()) {
    print("\nХод ${first.name}:");

    int damage = first.attack();
    second.defend(damage);

    if (!second.isAlive()) {
      break;
    }

    print("\nХод ${second.name}:");

    damage = second.attack();
    first.defend(damage);

    first.showStatus();
    second.showStatus();
  }

  print("\n=== КОНЕЦ БОЯ ===");

  if (first.isAlive()) {
    print("Победитель: ${first.name}!");
  } else {
    print("Победитель: ${second.name}!");
  }
}

// Главная функция
void main() {
  Bayonetta bayonetta = Bayonetta("Байонетта");
  Barbara barbara = Barbara("Барбара");
  Dante dante = Dante("Данте");

  print("=== НАШИ RPG-ПЕРСОНАЖИ ===");

  bayonetta.showStatus();
  barbara.showStatus();
  dante.showStatus();

  // Сражение Байонетты и Барбары
  battle(bayonetta, barbara);
}
