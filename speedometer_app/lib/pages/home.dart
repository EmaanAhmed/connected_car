import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedometer_app/providers/home_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: AssetImage("assets/images/logo.jpg"),
                      fit: BoxFit.fill)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          FittedBox(
                            child: Text(
                              'Current Speed',
                              style: TextStyle(
                                fontSize: 50,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.blue[700],
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          FittedBox(
                            child: Text(
                              'Current Speed',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          FittedBox(
                            child: Text(
                              '${homeProvider.currentSpeed}\nKmh',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black,
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          FittedBox(
                            child: Text(
                              '${homeProvider.currentSpeed}\nKmh',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.blue[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          FittedBox(
                            child: Text(
                              'From 10 to 30',
                              style: TextStyle(
                                fontSize: 50,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.blue[700],
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          FittedBox(
                            child: Text(
                              'From 10 to 30',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          FittedBox(
                            child: Text(
                              '${homeProvider.takenTimeFromTen}\nSeconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black,
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          FittedBox(
                            child: Text(
                              '${homeProvider.takenTimeFromTen}\nSeconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.blue[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          FittedBox(
                            child: Text(
                              'From 30 to 10',
                              style: TextStyle(
                                fontSize: 50,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.blue[700],
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          FittedBox(
                            child: Text(
                              'From 30 to 10',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          FittedBox(
                            child: Text(
                              '${homeProvider.takenTimeToTen}\nSeconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black,
                              ),
                            ),
                          ),
                          // Solid text as fill.
                          FittedBox(
                            child: Text(
                              '${homeProvider.takenTimeToTen}\nSeconds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.blue[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
