import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const key = 'sample';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const usePrefs = true; // Change this value during repro
  // Theory: Wait for data from preferences
  final child = usePrefs
      // ignore: dead_code
      ? MainApp(
          sampleString: (prefs) => prefs!.getString(key),
          prefs: await SharedPreferences.getInstance(),
        )
      // ignore: dead_code
      : MainApp(
          sampleString: (_) => 'NOT_FROM_PREFS',
          prefs: null,
        );
  runApp(child);
}

class MainApp extends StatelessWidget {
  final Function(SharedPreferences?) sampleString;
  final SharedPreferences? prefs;

  const MainApp({
    super.key,
    required this.sampleString,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(sampleString(prefs)),
              ),
              FilledButton(
                onPressed: () async {
                  await prefs?.setString(key, 'Hello World');
                },
                child: const Text('Write'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
