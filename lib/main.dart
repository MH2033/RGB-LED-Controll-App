import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/loading.dart';

void main() => runApp(
      MaterialApp(
        home: InitialLoading(),
        routes: {
          '/home': (context) => Home(),
        },
      ),
    );