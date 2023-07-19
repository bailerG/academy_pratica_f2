import 'dart:math';

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
  final random = Random();
  var quadrado = true;
  var cor = const Color.fromRGBO(244, 67, 54, 1);

  String get textoBotao =>
      quadrado ? "Mudar para circulo" : "Mudar para quadrado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quadrado = !quadrado;
                    });
                  },
                  child: Text(textoBotao),
                )),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    var r = random.nextInt(255);
                    var g = random.nextInt(255);
                    var b = random.nextInt(255);
                    cor = Color.fromARGB(255, r, g, b);
                  });
                },
                child: const Text('Mudar cor'))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: cor,
                    shape: quadrado ? BoxShape.rectangle : BoxShape.circle),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
