import 'package:flutter/material.dart';
import '../Bloc/countbloc.dart';

class FirstApp extends StatefulWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  _FirstAppState createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc 패턴"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: countBloc.count,
          initialData: countBloc.currentCount,
          builder: (context, snapshot) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              countBloc.add();
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              countBloc.subtraction();
            },
          )
        ],
      ),
    );
  }
}
