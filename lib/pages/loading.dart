import 'package:espled/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tcp_scanner/tcp_scanner.dart';

class InitialLoading extends StatefulWidget {
  @override
  _InitialLoadingState createState() => _InitialLoadingState();
}

class _InitialLoadingState extends State<InitialLoading> {

  Future result;

  Future connectToDevice() async {
    for (int i = 0; i < 20; i++) {
      var result = await TCPScanner("192.168.1." + i.toString(), [5436]).scan();
      print(result.host);
      if (result.open.contains(5436)) {
        return result.host;
      }
    }
    return null;
  }

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
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
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
              break;
            case ConnectionState.none:
              return Text("Cant find the devie");
              break;
            case ConnectionState.active:
              return Text("Cant find the devie");
              break;
            case ConnectionState.done:
              return Home(ip: snapshot.data,);
              break;
            default:
            //return Home();
          }
        });
  }
}
