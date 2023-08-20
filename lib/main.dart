import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_again/Screens/Favourite_Screen.dart';
import 'package:provider_again/Provider/count_example.dart';
import 'package:provider_again/Screens/example_One.dart';

import 'Provider/Example_one_provider.dart';
import 'Provider/Favourite_provider.dart';
import 'Screens/Counter_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => exampleOneProvider(),
        ),
        ChangeNotifierProvider(create: (_) => countProvider() ,),
        ChangeNotifierProvider(create: (_)=> FavouriteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FavouriteScreen(),
      ),
    );
  }
}
