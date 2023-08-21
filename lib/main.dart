import 'package:flutter/material.dart';

const key = 'sample';
void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  // final Function(SharedPreferences?) sampleString;
  // final SharedPreferences? prefs;

  const MainApp({
    super.key,
    // required this.sampleString,
    // required this.prefs,
  });

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
