import 'package:bloc_and_dio_test/bloc/home_bloc.dart';
import 'package:bloc_and_dio_test/bloc/counter_event.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _counter = "";
  static const platform = const MethodChannel("flutter.native/helper");

  void getHttp() async {
    try {
      var response = await Dio()
          .get('https://gb-mobile-app-teste.s3.amazonaws.com/data.json');
      if (kDebugMode) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.toString()),
        ));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _openKeyboard() async {
    String res = "";
    try {
      final String result = await platform.invokeMethod("helloFromNative");
      res = result;
    } on PlatformException catch (e) {}

    setState(() {
      _counter = res;
    });
  }

  // utilizando o setState
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _regressCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // child: StreamBuilder(
        //   stream: bloc.counter,
        //   initialData: 0,
        //   builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        //     return Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         const Text('You have pushed the button this many times:'),
        //         Text(
        //           '${snapshot.data}',
        //           style: Theme.of(context).textTheme.displayMedium,
        //         ),
        //       ],
        //     );
        //   },
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // FloatingActionButton(
          //   onPressed: () => bloc.counterEventController.add(IncrementEvent()),
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ),
          FloatingActionButton(
            onPressed: _openKeyboard,
            tooltip: "open keyboard",
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => bloc.counterEventController.add(RegressEvent()),
            tooltip: 'Regress',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              getHttp();
            },
            tooltip: 'getHttp',
            child: const Icon(Icons.access_time),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}