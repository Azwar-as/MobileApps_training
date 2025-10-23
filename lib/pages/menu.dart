import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        'Nasi Goreng Khas Malang',
        'assets/images/nasi-goreng.png',
        Colors.teal,
      ),
      Menu(
        'Nasi Goreng Khas Semarang',
        'assets/images/nasi-goreng.png',
        Colors.orangeAccent,
      )
    ];
  }
}
