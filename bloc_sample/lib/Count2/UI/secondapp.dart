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
      appBar: AppBar(
        title: const Text("StatefulWidget"),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => setState(() {
              count++;
            }),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => setState(() {
              if (count > 0) count--;
            }),
          )
        ],
      ),
    );
  }
}
