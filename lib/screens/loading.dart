import 'package:espled/screens/loadingBall.dart';
import 'package:espled/screens/home.dart';
import 'package:espled/services/connectToDevice.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tcp_scanner/tcp_scanner.dart';

import 'connectionError.dart';

class InitialLoading extends StatefulWidget {
  @override
  _InitialLoadingState createState() => _InitialLoadingState();
}

class _InitialLoadingState extends State<InitialLoading> {
  Future result;

  @override
  void initState() {
    result = connectToDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: result,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home(
            ip: snapshot.data,
          );
        } else if (snapshot.hasError) {
          return ConnectionError();
        } else {
          return LoadingBall();
        }
      },
    );
  }
}