import 'package:flutter/material.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_page.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context);
    if (!appConfig.envConfig.displayEnv) {
      return AppRootMain();
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
          color: Colors.red,
          message: appConfig.env.toUpperCase(),
          location: BannerLocation.topStart,
          child: AppRootMain()),
    );
  }
}

/*
class AppRootProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: AppRootMain(),
    );
  }
}
*/

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
