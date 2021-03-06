import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/app_root.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/config/environments/prod.dart';

void main() {
  final _ = AppConfig()..envConfig = EnvConfigProd();
  runApp(ProviderScope(child: AppRoot()));
}
