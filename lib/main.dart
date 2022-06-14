import 'package:flutter/material.dart';
import 'package:forty_hadith_of_an_nawawi/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forty Hadith of Shah Waliullah Dehlawi',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainScreenX(),
    );
  }
}
