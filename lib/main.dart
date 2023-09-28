import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/tip_page.dart';
import 'package:tip_time/tip_time_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.green),
        title: 'Material App',
        home: ChangeNotifierProvider(
          create: (context) => TipTimeProvider(),
          child: TipPage(),
        ));
  }
}
