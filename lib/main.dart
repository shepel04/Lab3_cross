import 'package:flutter/material.dart';

import 'checkbox_group.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('CheckBox Group')),
        body: const SingleChildScrollView(
          child: CheckboxGroup(
            title: 'Select all',
            items: ['Milk', 'Bread', 'Eggs', 'Cheese'],
          ),
        ),
      ),
    );
  }
}
