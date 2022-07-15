import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Custom_loader extends StatelessWidget {
  const Custom_loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: Colors.blueAccent,
      size: 40,
    );
  }
}
