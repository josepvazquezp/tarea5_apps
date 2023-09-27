import 'package:flutter/material.dart';
import 'package:forage/home_page.dart';
import 'package:provider/provider.dart';
import 'package:forage/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => LocalProvider(), child: MyApp()));

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Color.fromARGB(255, 80, 47, 220)),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
