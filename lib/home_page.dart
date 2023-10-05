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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: context.watch<LocalProvider>().getList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                context
                    .read<LocalProvider>()
                    .detailSave(context.read<LocalProvider>().getList[index]);

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${context.watch<LocalProvider>().getList[index]["name"]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${context.watch<LocalProvider>().getList[index]["location"]}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (context.watch<LocalProvider>().getList[index]
                          ["location"] !=
                      "")
                    Divider(),
                ],
              ),
            ),
          );
        },
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
