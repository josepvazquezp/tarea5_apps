import 'package:tip_time/tip_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipPage extends StatefulWidget {
  const TipPage({super.key});

  @override
  State<TipPage> createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  var moneyController = TextEditingController();

  void _showAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('ALERTA'),
              content: Text('No se llenaron todos los campos'));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Tip Time',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Icon(Icons.room_service),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: TextField(
                              controller: moneyController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Cost of Service'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.dinner_dining,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'How was the service',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue:
                                context.watch<TipTimeProvider>().get_service,
                            onChanged: (value) {
                              context.read<TipTimeProvider>().setService(value);
                            },
                          ),
                          Text('Amazing 20%')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue:
                                context.watch<TipTimeProvider>().get_service,
                            onChanged: (value) {
                              context.read<TipTimeProvider>().setService(value);
                            },
                          ),
                          Text('Good 18%')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue:
                                context.watch<TipTimeProvider>().get_service,
                            onChanged: (value) {
                              context.read<TipTimeProvider>().setService(value);
                            },
                          ),
                          Text('Okay 15%')
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payment,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Round Up Tip',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Switch(
                          value: context.watch<TipTimeProvider>().get_isRounder,
                          onChanged: (bool value) {
                            context.read<TipTimeProvider>().setRounded();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          color: Colors.green,
                          onPressed: () {
                            if (moneyController.text.isEmpty ||
                                context.read<TipTimeProvider>().get_service ==
                                    null) {
                              _showAlert();
                            } else {
                              context.read<TipTimeProvider>().calculate(
                                  double.parse(moneyController.text));
                            }
                          },
                          child: Text(
                            'Calculate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                    'Tip Amount: \$${context.watch<TipTimeProvider>().get_tipAmount.toStringAsFixed(2)}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
