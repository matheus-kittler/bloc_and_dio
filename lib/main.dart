import 'package:bloc_and_dio_test/bloc/home_bloc.dart';
import 'package:bloc_and_dio_test/bloc/counter_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Payment Link',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Escolha como compartilhar o link'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  constraints:
                      const BoxConstraints(maxHeight: 195, maxWidth: 400),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(4.0, 4.0), //(x,y)
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("R\$ 125,00"),
                      Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(maxWidth: 370, maxHeight: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.red
                        ),
                        child: const Text("https://finance.2DFSEW2"),
                      ),
                      Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(maxWidth: 370, maxHeight: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.blue
                        ),
                        child: const Text("test"),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
