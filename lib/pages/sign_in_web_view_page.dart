import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/helpers/oauth2_client.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignInWebViewPage extends HookWidget {
  static String routeName = '/sign_in_web_view';
  final _appConfig = AppConfig();

  @override
  Widget build(BuildContext context) {
    const title = 'Sign in(WebView)';
    WebViewController controller;
    final controllerCompleter = Completer<WebViewController>();
    final oauth2Client = OAuth2Client();
    final authStateNotifier = useProvider(authStateProvider);

    return WillPopScope(
      onWillPop: () async {
        if (controller != null && await controller.canGoBack()) {
          await controller.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(title),
            actions: <Widget>[
              NavigationControls(controllerCompleter.future),
            ],
          ),
          drawer: DrawerContent(),
          body: Builder(builder: (BuildContext context) {
            return WebView(
              initialUrl: oauth2Client.getAuthorizationUrl(),
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onWebViewCreated: (WebViewController webViewController) async {
                controller = webViewController;
                controllerCompleter.complete(webViewController);
              },
              onPageStarted: (String url) async {
                if (oauth2Client.isRedirectUrlWithCode(url)) {
                  final code = OAuth2Client().getCodeFromUrl(url);

                  try {
                    await authStateNotifier.fetchTokenAndUserByCode(code);

                    await Fluttertoast.showToast(
                      msg: 'Signed in.',
                      backgroundColor: _appConfig.toastBackgroundColor,
                      textColor: _appConfig.toastTextColor,
                    );

                    await Navigator.of(context)
                        .pushReplacementNamed(HomePage.routeName);
                  } on openapi.ApiException catch (_) {}
                }
              },
            );
          })),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final webViewReady = snapshot.connectionState == ConnectionState.done;
        final controller = snapshot.data;

        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady ? null : controller.reload,
            ),
          ],
        );
      },
    );
  }
}
