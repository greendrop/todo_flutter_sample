import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CenterCircularProgressIndicator extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(), heightFactor: 2);
  }
}
