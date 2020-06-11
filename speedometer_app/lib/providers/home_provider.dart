import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors/sensors.dart';

class HomeProvider with ChangeNotifier {
  var _currentSpeed;
  var _currentAcceleration;
  var _takenTimeFromTen;
  var _takenTimeToTen;
  List<StreamSubscription<dynamic>> _streamSubscriptions;

  HomeProvider() {
    _currentSpeed = 0;
    _currentAcceleration = 0;
    _takenTimeFromTen = 0;
    _takenTimeToTen = 0;
    _streamSubscriptions = <StreamSubscription<dynamic>>[];
    calcCurrentSpeed();
    calcTimeFromTen();
    calcTimeToTen();
  }

  // Getters
  get currentSpeed => _currentSpeed;
  get takenTimeFromTen => _takenTimeFromTen;
  get takenTimeToTen => _takenTimeToTen;

  //Setters
  void setCurrentSpeed(var currentSpeed) {
    _currentSpeed = currentSpeed;
    notifyListeners();
  }

  void setTakenTimeFromTen(var takenTimeFromTen) {
    _takenTimeFromTen = takenTimeFromTen;
    notifyListeners();
  }

  void setTakenTimeToTen(var takenTimeToTen) {
    _takenTimeToTen = takenTimeToTen;
    notifyListeners();
  }

  void calcCurrentSpeed() {
    var geolocator = Geolocator();
    var options = LocationOptions(accuracy: LocationAccuracy.high);
    geolocator.getPositionStream(options).listen((position) {
      setCurrentSpeed((position.speed * 3.6).toInt());
    });
  }

  void calcTimeFromTen() {
    var initialVelocity = 10 / (1000 / 3600); //km/h -> m/s
    var finalVelocity = 30 / (1000 / 3600); //km/h -> m/s

    var _deltaVelocity = finalVelocity - initialVelocity;
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      var x = event.x;
      var y = event.y;
      var z = event.z;
      _currentAcceleration = (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))).abs();
      setTakenTimeFromTen((_deltaVelocity ~/ _currentAcceleration).abs());
    }));
  }

  void calcTimeToTen() {
    var initialVelocity = 30 / (1000 / 3600); //km/h -> m/s
    var finalVelocity = 10 / (1000 / 3600); //km/h -> m/s

    var _deltaVelocity = finalVelocity - initialVelocity;
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      var x = event.x;
      var y = event.y;
      var z = event.z;
      _currentAcceleration = (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))).abs();
      setTakenTimeToTen((_deltaVelocity ~/ _currentAcceleration).abs());
    }));
  }
}
