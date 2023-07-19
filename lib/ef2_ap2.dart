import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StackColors(backgroundColor: Colors.grey, children: [
          Colors.red,
          Colors.green,
          Colors.blue,
        ]),
        StackColors(
          backgroundColor: Colors.black,
          children: [
            Colors.cyan,
            Colors.purple,
            Colors.yellow,
          ],
        ),
        StackColors(
          children: [
            Colors.red,
            Colors.yellow,
            Colors.blue,
          ],
        ),
        StackColors(
          backgroundColor: Colors.white,
          children: [
            Colors.deepPurple,
            Colors.deepOrange,
            Colors.yellow,
            Colors.lime,
          ],
        ),
      ],
    );
  }
}

class StackColors extends StatelessWidget {
  const StackColors({super.key, this.backgroundColor, required this.children});

  final Color? backgroundColor;
  final List<Color> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: backgroundColor,
      width: 90,
      height: 90,
      child: Stack(children: [
        for (var i = 0; i < children.length; i++)
          Positioned(
            top: i * 8 + 8,
            left: i * 8 + 8,
            child: Container(
              width: 50,
              height: 50,
              color: children[i],
            ),
          )
      ]),
    );
  }
}
