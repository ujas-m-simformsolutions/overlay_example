
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

BuildContext? buildContext;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _incrementCounter() {
    final entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned(
            top: 200,
            left: 100,
            child: IgnorePointer(
              ignoring: false,
              child: GestureDetector(
                onTap: () {
                  print('object2');
                },
                // behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(buildContext!).insert(
      entry,
    );
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: const VisualDensity(vertical: 1)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('widget.title'),
        ),
        body: Stack(
          children: [
            Builder(builder: (context) {
                buildContext = context;
              return GestureDetector(
                onTap: () {
                  print('object');
                },
                child: Container(
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  OverlayEntry? entry;

  void _incrementCounter() {
    entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned(
            top: 200,
            left: 100,
            child: IgnorePointer(
              ignoring: false,
              child: GestureDetector(
                onTap: () {
                  print('object2');
                },
                // behavior: HitTestBehavior.translucent,
                child: GestureDetector(
                  onTap: () {
                    print('object3');
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(buildContext!).insert(
      entry!,
    );
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Builder(builder: (context) {
            //  buildContext = context;
            return GestureDetector(
              onTap: () {
                print('object');
              },
              child: Container(
                color: Colors.yellow,
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
            );
          }),
          Testing(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      _incrementCounter,
    );
  }

  void _incrementCounter() {
    entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          Positioned(
            top: 200,
            left: 100,
            child: IgnorePointer(
              ignoring: false,
              child: GestureDetector(
                onTap: () {
                  print('object2');
                },
                // behavior: HitTestBehavior.translucent,
                child: GestureDetector(
                  onTap: () {
                    print('object3');
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(
      entry!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
