import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Could Find the device!",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
            FlatButton(
              color: Colors.grey,
              child: Text("Retry"),
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}