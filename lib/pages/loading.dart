import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';

class InitialLoading extends StatefulWidget {
  @override
  _InitialLoadingState createState() => _InitialLoadingState();
}

class _InitialLoadingState extends State<InitialLoading> {

  Future connectToDevice(){
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {

    connectToDevice().whenComplete(() {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Loading(
                indicator: BallScaleIndicator(),
                size: 100,
                color: Colors.tealAccent[700],
              ),
              Text(
                  'Connecting to device',
                style: TextStyle(
                  fontSize: 18,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
