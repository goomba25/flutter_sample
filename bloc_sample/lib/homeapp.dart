import 'package:bloc_sample/FirstApp/UI/firstapp.dart';
import 'package:bloc_sample/SecondApp/UI/secondapp.dart';
import 'package:flutter/material.dart';
import 'FirstApp/UI/firstapp.dart';
import 'SecondApp/UI/secondapp.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              "Sample",
              style: TextStyle(
                fontSize: 80,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 150,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_box_outlined,
                    size: 60,
                  ),
                  label: const Text(
                    " Bloc 패턴",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return FirstApp();
                    }));
                  },
                ),
              ),
              SizedBox(
                width: 500,
                height: 150,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.add_box_outlined,
                    size: 60,
                  ),
                  label: const Text(
                    "Stateful Widget",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SecondApp();
                    }));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
