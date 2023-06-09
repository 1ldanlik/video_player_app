import 'package:flutter/material.dart';

import 'drag_page.dart';
import 'video_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DragPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              height: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.black,
              height: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.black,
              height: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.black,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
