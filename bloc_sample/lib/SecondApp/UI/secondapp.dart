import 'package:flutter/material.dart';

class SecondApp extends StatefulWidget {
  const SecondApp({Key? key}) : super(key: key);

  @override
  _SecondAppState createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
