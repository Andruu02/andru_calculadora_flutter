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
      title: 'Andru Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
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
  final TextEditingController _ctrlDisplay = TextEditingController(text: "");
  double aux1 = 0;
  double aux2 = 0;
  String operacion = "";

  void setAux1(String sim) {
    operacion = sim;
    aux1 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void setAux2() {
    aux2 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void calcular() {
    double resultado = 0;
    if (operacion == "+") {
      resultado = aux1 + aux2;
    } else if (operacion == "-") {
      resultado = aux1 - aux2;
    } else if (operacion == "*") {
      resultado = aux1 * aux2;
    } else if (operacion == "/") {
      if (aux2 != 0) {
        resultado = aux1 / aux2;
      } else {
        resultado = double.nan; // Para evitar división por cero
      }
    }
    _ctrlDisplay.text = "${resultado}";
  }

  // Funciones para manejar los botones 'C' y 'CE'
  void clearAll() {
    setState(() {
      _ctrlDisplay.text = "";
      aux1 = 0;
      aux2 = 0;
      operacion = "";
    });
  }

  void clearLastEntry() {
    setState(() {
      _ctrlDisplay.text = _ctrlDisplay.text.isNotEmpty
          ? _ctrlDisplay.text.substring(0, _ctrlDisplay.text.length - 1)
          : "";
    });
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
            TextField(
              controller: _ctrlDisplay,
              decoration: InputDecoration(labelText: ''),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 34),
            ),
            Row(
              children: [
                BtnDark(
                  simbolo: "%",
                  onClick:
                      () {}, // Puedes agregar una función para el botón de porcentaje si deseas
                ),
                BtnDark(
                  simbolo: "CE",
                  onClick:
                      clearLastEntry, // Elimina el último carácter ingresado
                ),
                BtnDark(
                  simbolo: "C",
                  onClick: clearAll, // Elimina todo
                ),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "1",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}1";
                  },
                ),
                BtnLight(
                  numero: "2",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}2";
                  },
                ),
                BtnLight(
                  numero: "3",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}3";
                  },
                ),
                BtnDark(
                  simbolo: "+",
                  onClick: () {
                    setAux1("+");
                  },
                ),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "4",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}4";
                  },
                ),
                BtnLight(
                  numero: "5",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}5";
                  },
                ),
                BtnLight(
                  numero: "6",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}6";
                  },
                ),
                BtnDark(
                  simbolo: "-",
                  onClick: () {
                    setAux1("-");
                  },
                ),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "7",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}7";
                  },
                ),
                BtnLight(
                  numero: "8",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}8";
                  },
                ),
                BtnLight(
                  numero: "9",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}9";
                  },
                ),
                BtnDark(
                  simbolo: "*",
                  onClick: () {
                    setAux1("*");
                  },
                ),
              ],
            ),
            Row(
              children: [
                BtnLight(
                  numero: "0",
                  onClick: (String numero) {
                    _ctrlDisplay.text = "${_ctrlDisplay.text}0";
                  },
                ),
                BtnDark(
                  simbolo: "=",
                  onClick: () {
                    setAux2();
                    calcular();
                  },
                ),
                BtnDark(
                  simbolo: "/",
                  onClick: () {
                    setAux1("/");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
