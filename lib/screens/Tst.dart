import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(children: [
          SizedBox(
            child: Image.asset("assets/test1.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 30),
            child: Text(
              "Welcom",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 55),
            child: Text(
              "Back ! ",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ])
      ]),
    );
  }
}
