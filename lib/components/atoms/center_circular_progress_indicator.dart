import 'package:flutter/material.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(), heightFactor: 2);
  }
}
