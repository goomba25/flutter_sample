import 'package:bloc_sample/Count1/Bloc/countbloc.dart';
import 'package:flutter/material.dart';
import 'Count1/UI/firstapp.dart';
import 'Count2/UI/secondapp.dart';
import 'List1/UI/thirdapp.dart';
import 'List2/UI/fourthapp.dart';
import 'Count1/Bloc/countbloc.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  void dispose() {
    super.dispose();
    countBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Sample App"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: StreamBuilder<int>(
                stream: countBloc.count,
                builder: (context, snapshot) {
                  return Text(
                    'Count : ${snapshot.data}',
                    textScaleFactor: 2.5,
                  );
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add_box_outlined,
                ),
                label: const Text(
                  " Bloc 패턴",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Noto Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const FirstApp();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add_box_outlined,
                ),
                label: const Text(
                  "StatefulWidget",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Noto Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const SecondApp();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 220,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add_box_outlined,
                ),
                label: const Text(
                  "ListApp Bloc 패턴",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Noto Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const ThirdApp();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 220,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add_box_outlined,
                ),
                label: const Text(
                  " ListApp Stateful",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Noto Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const FourthApp();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
