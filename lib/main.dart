import 'package:flutter/material.dart';

void main() {
  // Set the ErrorWidget's builder before the app is started.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(details.summary.toString()),
              Text(details.silent.toString()),
              Text(details.exception.toString()),
              Text(details.exceptionAsString()),
              Text(details.library!.toUpperCase().toString()),
            ],
          ),
        ),
      ),
    );
  };
  // Start the app.
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // throw ("Error thrown from initState(), This is Dummy Error Example");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic "),
        ),
        body: const Text('Flutter Demo Home Page'),
      ),
    );
  }
}
