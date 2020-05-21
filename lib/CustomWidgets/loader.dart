import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatelessWidget {
  Color color;

  ProgressBar(this.color);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: Color.fromRGBO(22, 158, 183, 1),
      size: 30,
    );
  }
}
