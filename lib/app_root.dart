import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_web_view_page.dart';
import 'package:todo_flutter_sample/pages/task/detail_page.dart';
import 'package:todo_flutter_sample/pages/task/edit_page.dart';
import 'package:todo_flutter_sample/pages/task/list_page.dart';
import 'package:todo_flutter_sample/pages/task/new_page.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class AppRoot extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig();
    if (!appConfig.envConfig.displayEnv) {
      return AppRootMain();
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
          color: Colors.red,
          message: appConfig.envConfig.env.toUpperCase(),
          location: BannerLocation.topStart,
          child: AppRootMain()),
    );
  }
}

class AppRootMain extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final refreshTokenTimer = useState<Timer>(null);
    final authStateNotifier = useProvider(authStateProvider);

    useEffect(() {
      Timer.run(() async {
        await authStateNotifier.initializeToken();
        await authStateNotifier.initializeUser();

        refreshTokenTimer.value =
            Timer.periodic(const Duration(minutes: 1), (timer) {
          authStateNotifier.refreshToken();
        });

        isInitialized.value = true;
      });

      return () {
        refreshTokenTimer.value.cancel();
      };
    }, []);

    return MaterialApp(
        title: 'ToDo Flutter Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomePage.routeName,
        routes: <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => HomePage(),
          SignInPage.routeName: (BuildContext context) => SignInPage(),
          SignInWebViewPage.routeName: (BuildContext context) =>
              SignInWebViewPage(),
          TaskListPage.routeName: (BuildContext context) => TaskListPage(),
          TaskDetailPage.routeName: (BuildContext context) => TaskDetailPage(),
          TaskNewPage.routeName: (BuildContext context) => TaskNewPage(),
          TaskEditPage.routeName: (BuildContext context) => TaskEditPage(),
        });
  }
}
