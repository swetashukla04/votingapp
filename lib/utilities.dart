import 'package:flutter/material.dart';
import 'package:votingapp/state/authentication.dart';

void gotoHomeScreen(BuildContext context, AuthenticationState authState) {
  Future.microtask(() {
    if (authState.authStatus == kAuthSuccess) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  });
}

void gotoLoginScreen(BuildContext context, AuthenticationState authState) {
  Future.microtask(() {
    if (authState.authStatus == null) {
      Navigator.pushReplacementNamed(context, '/');
    }
  });
}