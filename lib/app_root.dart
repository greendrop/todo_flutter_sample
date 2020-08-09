import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_page.dart';
import 'package:todo_flutter_sample/pages/task/detail_page.dart';
import 'package:todo_flutter_sample/pages/task/edit_page.dart';
import 'package:todo_flutter_sample/pages/task/list_page.dart';
import 'package:todo_flutter_sample/pages/task/new_page.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';
import 'package:todo_flutter_sample/states/task_create_state.dart';
import 'package:todo_flutter_sample/states/task_delete_state.dart';
import 'package:todo_flutter_sample/states/task_detail_state.dart';
import 'package:todo_flutter_sample/states/task_form_state.dart';
import 'package:todo_flutter_sample/states/task_list_state.dart';
import 'package:todo_flutter_sample/states/task_update_state.dart';

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
        StateNotifierProvider<TaskListStateNotifier, TaskListState>(
            create: (_) => TaskListStateNotifier()),
        StateNotifierProvider<TaskDetailStateNotifier, TaskDetailState>(
            create: (_) => TaskDetailStateNotifier()),
        StateNotifierProvider<TaskFormStateNotifier, TaskFormState>(
            create: (_) => TaskFormStateNotifier()),
        StateNotifierProvider<TaskCreateStateNotifier, TaskCreateState>(
            create: (_) => TaskCreateStateNotifier()),
        StateNotifierProvider<TaskUpdateStateNotifier, TaskUpdateState>(
            create: (_) => TaskUpdateStateNotifier()),
        StateNotifierProvider<TaskDeleteStateNotifier, TaskDeleteState>(
            create: (_) => TaskDeleteStateNotifier()),
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
        initialRoute: HomePage.routeName,
        routes: <String, WidgetBuilder>{
          HomePage.routeName: (BuildContext context) => HomePage(),
          SignInPage.routeName: (BuildContext context) => SignInPage(),
          TaskListPage.routeName: (BuildContext context) => TaskListPage(),
          TaskDetailPage.routeName: (BuildContext context) => TaskDetailPage(),
          TaskNewPage.routeName: (BuildContext context) => TaskNewPage(),
          TaskEditPage.routeName: (BuildContext context) => TaskEditPage(),
        });
  }
}
