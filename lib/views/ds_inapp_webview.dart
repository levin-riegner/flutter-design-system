import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/connectivity_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Remember to set `io.flutter.embedded_views_preview` to `YES` in iOS `Info.plist`
class InAppWebView extends StatefulWidget {

  final ValueNotifier<String> urlNotifier;
  final String javascriptChannelName;
  final List<WebViewAction> actions;
  final bool useScaffold;
  final String title;
  final Color backgroundColor;
  final String userAgent;
  final String userToken;
  final Widget noInternetView;

  InAppWebView({
    @required this.urlNotifier,
    this.javascriptChannelName = "MobileApp",
    this.actions = const [],
    this.title,
    this.backgroundColor,
    this.userAgent,
    this.userToken,
    bool useScaffold = false,
    Widget noInternetView,
  })  : useScaffold = title != null || useScaffold,
        this.noInternetView = noInternetView ?? Container();

  @override
  State<StatefulWidget> createState() {
    return _InAppWebViewState();
  }
}

class _InAppWebViewState extends State<InAppWebView> {
  bool hasInternet;
  StreamSubscription internetSubscription;

  WebViewController webViewController;

  _reloadUrl() {
    setState(() {
      webViewController?.loadUrl(
        widget.urlNotifier.value,
        headers: (widget.userToken != null) ? {"Authorization": "Bearer ${widget.userToken}"} : null,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // Subscribe to Url changes
    widget.urlNotifier.addListener(_reloadUrl);
    // Check initial connectivity
    ConnectivityHelper.isConnected().then((isConnected) {
      setState(() => this.hasInternet = isConnected);
      // Listen to connectivity if offline
      if (!isConnected) {
        internetSubscription = ConnectivityHelper.onIsConnectedChanged().listen((isConnected) {
          if (isConnected) {
            // Internet recovered, stop listening
            internetSubscription?.cancel();
            setState(() => this.hasInternet = isConnected);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    internetSubscription?.cancel();
    // Unsubscribe to Url changes
    widget.urlNotifier.addListener(_reloadUrl);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Prepare Javascript Channels
    List<JavascriptChannel> javascriptChannels = [
      JavascriptChannel(
        name: widget.javascriptChannelName,
        onMessageReceived: (JavascriptMessage result) {
          debugPrint("Got JavascriptMessage: ${result.message}");
          // Find action
          final action = widget.actions.firstWhere((action) => action.message == result.message, orElse: null);
          if (action != null) {
            // Custom Action
            action?.onReceived();
          } else if (result.message == "back" && widget.useScaffold) {
            // Default back action
            Navigator.of(context).pop();
          } else {
            // Unknown action
            debugPrint("Unhandled javascript message ${result.message}");
          }
        },
      )
    ];

    // Prepare Webview
    final body = hasInternet != false
        ? WebView(
            initialUrl: widget.urlNotifier.value,
            userAgent: widget.userAgent,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: Set.from(javascriptChannels),
            onWebViewCreated: (WebViewController webViewController) {
              this.webViewController = webViewController;
              // Maybe reload with Auth header
              if (widget.userToken != null) _reloadUrl();
            },
            onPageFinished: (url) {
              // Disable iOS allowLinksPreview
              webViewController.evaluateJavascript("document.body.style.webkitTouchCallout='none';");
            },
          )
        : widget.noInternetView;

    return widget.useScaffold
        ? Scaffold(
            backgroundColor: widget.backgroundColor,
            appBar: AppBar(
              title: widget.title != null ? Text(widget.title) : null,
              leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
              backgroundColor: widget.backgroundColor,
            ),
            body: SafeArea(
              child: body,
            ),
          )
        : body;
  }
}

class WebViewAction {
  final String message;
  final VoidCallback onReceived;

  WebViewAction({@required this.message, @required this.onReceived});
}
