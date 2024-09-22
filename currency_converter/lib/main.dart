import 'package:flutter/material.dart';
import 'package:currency_converter/currency_converter.dart';

void main() {
  runApp(const MyApp());
}

//? Types of widgets
//? 1. StatelessWidget
//? 2. StatefulWidget

//? State

//? 1. Material Design
//? 2. Cupertino Design

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverter(),
    );
  }
}
