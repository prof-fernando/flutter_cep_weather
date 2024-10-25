import 'package:flutter/material.dart';
import 'package:projeto_api/home_page.dart';

void main() {
  runApp(const CepApp());
}

class CepApp extends StatelessWidget {
  const CepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CEP APP',
      home: HomePage(),
    );
  }
}
