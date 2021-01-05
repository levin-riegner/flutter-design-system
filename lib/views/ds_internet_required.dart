import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/connectivity_helper.dart';
import 'package:lr_design_system/views/ds_content_placeholder_views.dart';

class DSInternetRequired extends StatefulWidget {
  final Widget child;
  final bool expanded;
  final VoidCallback onInternetAvailable;

  DSInternetRequired({
    this.expanded = true,
    @required this.child,
    @required this.onInternetAvailable,
  });

  @override
  _DSInternetRequiredState createState() => _DSInternetRequiredState();
}

class _DSInternetRequiredState extends State<DSInternetRequired> {
  bool hasInternet;
  StreamSubscription internetSubscription;

  @override
  void initState() {
    super.initState();
    // Check initial connectivity
    ConnectivityHelper.isConnected().then((isConnected) {
      if (hasInternet != true) {
        setState(() => this.hasInternet = isConnected);
        // Listen to connectivity if offline
        if (!isConnected) {
          internetSubscription =
              ConnectivityHelper.onIsConnectedChanged().listen((isConnected) {
            if (isConnected) {
              // Internet recovered, stop listening
              internetSubscription?.cancel();
              setState(() => this.hasInternet = isConnected);
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    internetSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return hasInternet == true
        ? widget.child
        : DSNoInternetView(
            expanded: widget.expanded,
            onRefresh: widget.onInternetAvailable,
          );
  }
}
