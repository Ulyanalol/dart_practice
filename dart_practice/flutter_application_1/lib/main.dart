
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Карточка товара'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Наушники JBL Tune 510BT',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Image.network(
                  'https://placehold.co/400x250/png?text=JBL+Headphones',
                  height: 180,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.headphones,
                      size: 150,
                      color: Colors.blue,
                    );
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'Беспроводные наушники с качественным звуком, '
                    'удобной конструкцией и длительным временем работы.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Цена: 3490 ₽',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '⭐ 4.8',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
