import 'package:first_flutter_proj/screens/second_page.dart';
import 'package:flutter/material.dart';
import '../widgets/counter_display.dart';
import '../widgets/increment_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CounterDisplay(counter: _counter),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage())
              );
            }, child: const Text("Go to Second Page"))
          ],
        ),
      ),
      floatingActionButton: IncrementButton(onPressed: _incrementCounter),
    );
  }
}
