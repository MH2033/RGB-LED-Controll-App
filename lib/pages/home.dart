
import 'package:espled/pages/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isLoading = false;
  IconData icon = Icons.flash_off;
  bool state = false;

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('LED Controller'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: isLoading? 0.4: 1,
              child: Container(
                alignment: Alignment.center,
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
                        onChanged: isLoading? null:(value) {
                          setState(() {
                            state = value;
                            icon = state ? Icons.flash_on : Icons.flash_off;
                            Future.delayed(Duration(seconds: 2)).then((onValue) {
                              setState(() {
                                isLoading = false;
                              });

                            });
                            isLoading = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Visibility(
                visible: isLoading,
                child: Loading(
                  indicator: BallPulseIndicator(),
                  size: 100,
                  color: Colors.tealAccent[700],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
