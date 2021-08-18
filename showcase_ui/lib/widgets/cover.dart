import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset('logo.jpg'),
        Column(
          children: [
            Text(
              "Comparative Study of Machine Learning Algorithms for",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 17.0,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'text.png',
              height: 150,
            ),
            // Text(
            //   "BREAST CANCER DETECTION",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w800,
            //     fontSize: 80.0,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
