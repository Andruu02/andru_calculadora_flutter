import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andru calculadora',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 66, 224, 187),
        ),
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("1"),
            Text("2"),
            Row(
              children: [
                BtnDark(simbolo: "%"),
                BtnDark(simbolo: "CE"),
                BtnDark(simbolo: "C"),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "1",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "2",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "3",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "4",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "5",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "6",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "7",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "8",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
                BtnLight(
                  numero: "9",
                  onClick: (String numero) {
                    print("Main: $numero");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
