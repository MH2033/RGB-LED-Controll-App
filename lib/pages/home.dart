import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IconData icon = Icons.flash_off;
  bool state = false;
  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text('LED Controller'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Icon(
              icon,
              size: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Transform.scale(
              scale: 2.5,
              child: CupertinoSwitch(
                activeColor: Colors.greenAccent[700],
                value: state,
                onChanged: (value) {
                  setState(() {
                    state = value;
                    icon = state ? Icons.flash_on : Icons.flash_off;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
