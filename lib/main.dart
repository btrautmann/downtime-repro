import 'package:flutter/material.dart';

const key = 'sample';
void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('BOOP'),
        ),
      ),
    );
  }
}
