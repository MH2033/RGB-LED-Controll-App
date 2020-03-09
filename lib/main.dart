import 'package:espled/pages/home.dart';
import 'package:espled/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      home: InitialLoading(),
      routes: {
        '/home': (context) => Home(),
      }
    ));
