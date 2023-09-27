import 'package:flutter/material.dart';
import 'package:forage/details_page.dart';
import 'package:forage/inputs_page.dart';
import 'package:forage/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${context.watch<LocalProvider>().getName}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${context.watch<LocalProvider>().getLocation}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => InputsPage()),
          );
        },
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
