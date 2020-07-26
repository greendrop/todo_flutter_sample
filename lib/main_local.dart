import 'package:flutter/material.dart';
import 'package:todo_flutter_sample/app_root.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/config/environments/local.dart';

void main() {
  final _ = AppConfig()..envConfig = EnvConfigLocal();
  runApp(AppRoot());
}
