import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Home extends StatefulWidget {
  final String ip;
  Home({this.ip});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int portNumber = 5436;
  bool isLoading = false;
  IconData icon = Icons.flash_off;
  bool state = false;
  String dropdownValue = "off";
  int intensity = 0;

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var address = "http://" + widget.ip + ":" + portNumber.toString() + "/led";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        title: Text('LED Controller'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigoAccent, Colors.cyan[100]],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      progressBarColors: [
                        Colors.redAccent,
                        Colors.indigoAccent
                      ],
                    ),
                  ),
                  onChangeEnd: (double value) {
                    intensity = value * 255 ~/ 100;
                    //print(intensity);
                    var body = jsonEncode(
                        {'intensity': intensity.toString()});
                    http.post(address, body: body);
                  },
                ),
                SizedBox(height: 30),
                Text(
                  "LED Color",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black,fontSize: 14),
                  underline: Container(
                    height: 5,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      var body = jsonEncode(
                          {'led': dropdownValue});
                      http.post(address, body: body);
                    });
                  },
                  items: <String>['off', 'red', 'green', 'blue']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
