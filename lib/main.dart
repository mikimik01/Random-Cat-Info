import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatFactPage(),
    );
  }
}

class CatFactPage extends StatefulWidget {
  @override
  _CatFactPageState createState() => _CatFactPageState();
}

class _CatFactPageState extends State<CatFactPage> {
  String _catFact = "Press the button to get a cat fact!";

  Future<String> get() async {
    WidgetsFlutterBinding.ensureInitialized();

    final dio = Dio();

    try {
      final response = await dio.get("https://catfact.ninja/fact");
      return response.data['fact']; // Extract the fact from the response
    } catch (e) {
      return "Failed to fetch cat fact: $e";
    }
  }

  void _fetchCatFact() async {
    String newFact = await get();
    setState(() {
      _catFact = newFact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Facts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _catFact,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchCatFact,
              child: Text('Get Cat Fact'),
            ),
          ],
        ),
      ),
    );
  }
}
