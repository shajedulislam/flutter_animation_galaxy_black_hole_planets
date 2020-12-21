import 'package:flutter/material.dart';
import 'package:galaxy/galaxy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galaxy',
      home: Galaxy(),
    );
  }
}
