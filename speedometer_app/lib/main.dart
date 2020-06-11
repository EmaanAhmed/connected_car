import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedometer_app/pages/home.dart';
import 'package:speedometer_app/providers/home_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Orbitron"
        ),
        home: HomePage(),
      ),
    );
  }
}
