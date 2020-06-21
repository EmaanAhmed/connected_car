import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeProvider with ChangeNotifier {
  int _currentSpeed;
  // var _currentAcceleration;
  int _takenTimeFromTen;
  int _takenTimeToTen;
  DateTime _isTen;
  DateTime _isthirty;
  DateTime _isTenAgain;
  // List<StreamSubscription<dynamic>> _streamSubscriptions;

  HomeProvider() {
    _currentSpeed = 0;
    _takenTimeFromTen = 0;
    _takenTimeToTen = 0;

    // _currentAcceleration = 0;
    // _streamSubscriptions = <StreamSubscription<dynamic>>[];
    calcCurrentSpeed();
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
      if(_isTen == null && _isthirty == null && _currentSpeed >= 10 && _currentSpeed < 30 ){
        _isTen = DateTime.now();
      }
      if(_isthirty == null && _isTen != null && _currentSpeed >= 30) {
        _isthirty = DateTime.now();
      }
      if(_isTen != null && _isthirty != null) {
        calcTimeFromTen();
      }
      if(_isthirty!= null && _isTenAgain == null && _currentSpeed >= 10 && _currentSpeed < 30){
        _isTenAgain = DateTime.now();
      }
      if(_isTenAgain != null && _isthirty != null) {
        calcTimeToTen();
      }
      if(_isTen!= null && _isTenAgain!= null && _isthirty!=null) {
        _isTen = null;
        _isTenAgain = null;
        _isthirty = null;
      }
    });
  }

  calcTimeFromTen(){
    setTakenTimeFromTen(_isthirty.difference(_isTen).inSeconds);
  }

  calcTimeToTen(){
    setTakenTimeToTen(_isTenAgain.difference(_isthirty).inSeconds);
  }

  // void calcTimeFromTen() {
  //   var initialVelocity = 10 / (1000 / 3600); //km/h -> m/s
  //   var finalVelocity = 30 / (1000 / 3600); //km/h -> m/s

  //   var _deltaVelocity = finalVelocity - initialVelocity;
  //   _streamSubscriptions
  //       .add(accelerometerEvents.listen((AccelerometerEvent event) {
  //     var x = event.x;
  //     var y = event.y;
  //     var z = event.z;
  //     _currentAcceleration = (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))).abs();
  //     setTakenTimeFromTen((_deltaVelocity ~/ _currentAcceleration).abs());
  //   }));
  // }

  // void calcTimeToTen() {
  //   var initialVelocity = 30 / (1000 / 3600); //km/h -> m/s
  //   var finalVelocity = 10 / (1000 / 3600); //km/h -> m/s

  //   var _deltaVelocity = finalVelocity - initialVelocity;
  //   _streamSubscriptions
  //       .add(accelerometerEvents.listen((AccelerometerEvent event) {
  //     var x = event.x;
  //     var y = event.y;
  //     var z = event.z;
  //     _currentAcceleration = (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))).abs();
  //     setTakenTimeToTen((_deltaVelocity ~/ _currentAcceleration).abs());
  //   }));
  // }
}
