
import 'dart:math';

abstract class Shape {
 Shape();

  double area();

  factory Shape.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'circle':
        return Circle(json['radius'].toDouble());

      case 'rectangle':
        return Rectangle(
          json['width'].toDouble(),
          json['height'].toDouble(),
        );

      default:
        throw Exception('Неизвестная фигура!');
    }
  }
}

// Класс круга
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return pi * radius * radius;
  }
}

// Класс прямоугольника
class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

void main() {
  Map<String, dynamic> circleJson = {
    'type': 'circle',
    'radius': 5,
  };

  Map<String, dynamic> rectangleJson = {
    'type': 'rectangle',
    'width': 4,
    'height': 6,
  };

  Shape circle = Shape.fromJson(circleJson);
  Shape rectangle = Shape.fromJson(rectangleJson);

  print('Площадь круга: ${circle.area()}');
  print('Площадь прямоугольника: ${rectangle.area()}');
}
