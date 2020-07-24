import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({this.env, this.envConfig, Widget child})
      : super(child: child);

  final String env;
  final EnvConfig envConfig;

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig) as AppConfig;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

abstract class EnvConfig {
  bool displayEnv;
}
