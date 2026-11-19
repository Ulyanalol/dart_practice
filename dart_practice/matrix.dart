
void printMatrix(List<List<double>> matrix) {
  for (var row in matrix) {
    print(row);
  }
}

// Сложение матриц
List<List<double>> addMatrices(
    List<List<double>> a, List<List<double>> b) {
  if (a.length != b.length || a[0].length != b[0].length) {
    throw Exception("Размеры матриц не совпадают!");
  }

  return List.generate(
    a.length,
    (i) => List.generate(
      a[i].length,
      (j) => a[i][j] + b[i][j],
    ),
  );
}

// Вычитание матриц
List<List<double>> subtractMatrices(
    List<List<double>> a, List<List<double>> b) {
  if (a.length != b.length || a[0].length != b[0].length) {
    throw Exception("Размеры матриц не совпадают!");
  }

  return List.generate(
    a.length,
    (i) => List.generate(
      a[i].length,
      (j) => a[i][j] - b[i][j],
    ),
  );
}

// Умножение матрицы на число
List<List<double>> multiplyByNumber(
    List<List<double>> a, double number) {
  return a.map((row) =>
      row.map((value) => value * number).toList()).toList();
}

// Умножение матриц
List<List<double>> multiplyMatrices(
    List<List<double>> a, List<List<double>> b) {
  if (a[0].length != b.length) {
    throw Exception("Нельзя умножить эти матрицы!");
  }

  return List.generate(a.length, (i) =>
      List.generate(b[0].length, (j) {
        double sum = 0;
        for (int k = 0; k < b.length; k++) {
          sum += a[i][k] * b[k][j];
        }
        return sum;
      }));
}

// Транспонирование матрицы
List<List<double>> transposeMatrix(List<List<double>> a) {
  return List.generate(
    a[0].length,
    (j) => List.generate(a.length, (i) => a[i][j]),
  );
}

// Вычисление определителя
double determinant(List<List<double>> a) {
  if (a.isEmpty || a.any((row) => row.length != a.length)) {
    throw Exception("Матрица должна быть квадратной!");
  }

  if (a.length == 1) return a[0][0];

  if (a.length == 2) {
    return a[0][0] * a[1][1] - a[0][1] * a[1][0];
  }

  double result = 0;

  for (int j = 0; j < a.length; j++) {
    var minor = a.skip(1).map((row) =>
        [...row.sublist(0, j), ...row.sublist(j + 1)]).toList();

    result += (j.isEven ? 1 : -1) * a[0][j] * determinant(minor);
  }

  return result;
}

void main() {
  List<List<double>> a = [
    [1, 2],
    [3, 4],
  ];

  List<List<double>> b = [
    [5, 6],
    [7, 8],
  ];

  print("Матрица A:");
  printMatrix(a);

  print("\nМатрица B:");
  printMatrix(b);

  print("\nСложение:");
  printMatrix(addMatrices(a, b));

  print("\nВычитание:");
  printMatrix(subtractMatrices(a, b));

  print("\nУмножение на число 2:");
  printMatrix(multiplyByNumber(a, 2));

  print("\nУмножение матриц:");
  printMatrix(multiplyMatrices(a, b));

  print("\nТранспонирование A:");
  printMatrix(transposeMatrix(a));

  print("\nОпределитель A:");
  print(determinant(a));
}
