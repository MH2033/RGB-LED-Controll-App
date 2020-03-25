import 'package:espled/screens/loadingBall.dart';
import 'package:espled/screens/home.dart';
import 'package:espled/services/connectToDevice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          return Home(
            ip: snapshot.data,
          );
        } else if (snapshot.hasError && snapshot.connectionState == ConnectionState.done) {
          return ConnectionError();
        } else {
          return LoadingBall();
        }
      },
    );
  }
}