import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_page.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig();
    if (!appConfig.envConfig.displayEnv) {
      return AppRootProvider();
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
          color: Colors.red,
          message: appConfig.envConfig.env.toUpperCase(),
          location: BannerLocation.topStart,
          child: AppRootProvider()),
    );
  }
}

class AppRootProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AuthStateNotifier, AuthState>(
            create: (_) => AuthStateNotifier()),
      ],
      child: AppRootMain(),
    );
  }
}

class AppRootMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo Flutter Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => HomePage(),
          '/sign_in': (BuildContext context) => SignInPage(),
        });
  }
}
