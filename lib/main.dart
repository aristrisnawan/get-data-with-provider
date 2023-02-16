import 'package:flutter/material.dart';
import 'package:get_data_provider/home.dart';
import 'package:get_data_provider/provider/post_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: ((context) => PostProvider()),
          child: HomePage()
          )
      ),
    );
  }
}