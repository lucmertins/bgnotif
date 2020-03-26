import 'package:flutter/material.dart';
import './WorkBackground.dart';
import './Notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeNotification();
  initializeWorkBackground();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teste Backbround Process"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              showNotification();
            },
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
