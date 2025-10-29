import 'package:flutter/material.dart';

class Menu {
  final String nameVar;
  final String imagePath;
  final Color color;
  const Menu(
    this.nameVar,
    this.imagePath,
    this.color,
  );
  static List get dummy {
    return [
      Menu(
        'Nasi Goreng Spesial',
        'assets/images/nasi-goreng.png',
        Colors.teal,
      ),
      Menu(
        'Ayam Suwir',
        'assets/images/ayamsuwir.png',
        Colors.orangeAccent,
      ),
      Menu(
        'Soto Ayam',
        'assets/images/sotoAyam.png',
        Colors.teal,
      ),
      Menu(
        'Rendang',
        'assets/images/rendang.png',
        Colors.orangeAccent,
      ),
      Menu(
        'Rendang',
        'assets/images/sayurSop.png',
        Colors.teal,
      ),
    ];
  }
}
