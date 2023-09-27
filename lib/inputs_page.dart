import 'package:flutter/material.dart';
import 'package:forage/provider.dart';
import 'package:provider/provider.dart';

class InputsPage extends StatelessWidget {
  InputsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              width: 380,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      color: Color.fromARGB(255, 224, 224, 224),
                      child: TextField(
                        controller:
                            context.watch<LocalProvider>().nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          label: Text(
                            "Name",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      color: Color.fromARGB(255, 224, 224, 224),
                      child: TextField(
                        controller:
                            context.watch<LocalProvider>().locationController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          label: Text(
                            "Location",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: context.watch<LocalProvider>().getCheck,
                        onChanged: (value) {
                          context.read<LocalProvider>().setCheck();
                        },
                      ),
                      Text("Currently in season"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      color: Color.fromARGB(255, 224, 224, 224),
                      child: TextField(
                        controller:
                            context.watch<LocalProvider>().noteController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          label: Text(
                            "Notes",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            context.read<LocalProvider>().save();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromARGB(255, 80, 47, 220),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            context.read<LocalProvider>().reset();
                          },
                          child: Text(
                            "DELETE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Color.fromARGB(255, 80, 47, 220),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
