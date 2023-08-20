import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Example_one_provider.dart';

class Example_one extends StatefulWidget {
  const Example_one({Key? key}) : super(key: key);

  @override
  State<Example_one> createState() => _Example_oneState();
}

class _Example_oneState extends State<Example_one> {


  @override
  Widget build(BuildContext context) {
   // final examProvider = Provider.of<exampleOneProvider>(context,listen:true);
    print('object build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        color: Colors.brown,
        child: Column(
          children: [
            Consumer<exampleOneProvider>(
              builder: (context, ref, child) {
                return Slider(
                    min: 0,
                    max: 1,
                    value: ref.value ,
                    onChanged: (val) {
                     ref.incrementExampleProvider(val);
                    });
              }

            ),
            Consumer<exampleOneProvider>(builder: (context, ref, child) {
              return Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.red.withOpacity(ref.value),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey.withOpacity(ref.value),
                      )),
                ],
              );
            },),
          ],
        ),
      ),
    );
  }
}
