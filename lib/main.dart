import 'package:flutter/material.dart';
import 'camera.dart';
import 'welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Tree',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => WelcomePage(),
        '/welcome': (context) => WelcomePage(),
        '/camera': (context) => CameraScreen(),
      },
      initialRoute: '/',
    );
  }
}
