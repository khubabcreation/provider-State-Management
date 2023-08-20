import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_again/Provider/count_example.dart';

import '../Provider/count_example.dart';
import '../Provider/count_example.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('object');
    final countpro = Provider.of<countProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Column(

        children: [
          Center(
            child: Consumer<countProvider>(
              builder: (context, value, child) {
                return Text(value.count.toString());
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countpro.incrementCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
