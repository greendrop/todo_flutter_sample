import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Sign in Page';
    WebViewController controller;
    final controllerCompleter = Completer<WebViewController>();

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
              initialUrl: 'https://www.yahoo.co.jp',
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onWebViewCreated: (WebViewController webViewController) async {
                controller = webViewController;
                controllerCompleter.complete(webViewController);
              },
              onPageStarted: (String url) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(url),
                ));
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
