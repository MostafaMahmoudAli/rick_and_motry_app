import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeLayout(),
    );
  }
}


