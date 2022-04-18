import 'package:flutter/material.dart';

void main() {
  // Set the ErrorWidget's builder before the app is started.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // In release builds, show a yellow-on-blue message instead:
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber[300],
              boxShadow: [
                BoxShadow(color: Colors.green, spreadRadius: 3),
              ],
            ),
            child: Text(
              ' Error!\n ${details.exception}',
              style: const TextStyle(color: Colors.red, fontSize: 20),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
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

  static const String _title = 'ErrorWidget Sample';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool throwError = false;

  @override
  Widget build(BuildContext context) {
    if (throwError) {
      // Since the error widget is only used during a build, in this contrived example,
      // we purposely throw an exception in a build function.
      return Builder(
        builder: (BuildContext context) {
          throw Exception('oh no, You clicked on Button..! | Error Caught');
        },
      );
    } else {
      return MaterialApp(
        title: MyApp._title,
        home: Scaffold(
          appBar: AppBar(title: const Text(MyApp._title)),
          body: Center(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    //by setting throwError to true, above if condition will execute.
                    throwError = true;
                  });
                },
                child: const Text('Do Not Click me')),
          ),
        ),
      );
    }
  }
}
