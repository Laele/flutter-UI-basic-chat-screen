import 'package:flutter/material.dart';
import 'package:flutter_animations/presentation/screens/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData.light().copyWith(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(30.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            filledButtonTheme: FilledButtonThemeData(
                style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            ))),
        home: const MainScreen(),
      );
  }
}
