import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fracciones Continuas'),
        ),
        body: euclides(),
      ),
    );
  }
}

class euclides extends StatefulWidget {
  @override
  euclidesa createState() => euclidesa();
}

class euclidesa extends State<euclides> {
  TextEditingController numero1 = TextEditingController();
  TextEditingController numero2 = TextEditingController();
  List<int> fra = [];

  int euclides(int a, int b) {
    fra.add(a ~/ b);
    int resto = a % b;
    if (resto == 0) {
      return b;
    } else {
      return euclides(b, resto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: numero1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Numero 1'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: numero2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Numero 2'),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            int numeros1 = int.parse(numero1.text);
            int numeros2 = int.parse(numero2.text);
            int resultado = euclides(numeros1, numeros2);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Maximo Comun Divisor: $resultado'),
                  content: Text('Fracciones Continuas: $fra'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        fra.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Calcular MCD'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    numero1.dispose();
    numero2.dispose();
    super.dispose();
  }
}
