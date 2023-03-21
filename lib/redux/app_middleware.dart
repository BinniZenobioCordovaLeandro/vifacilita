import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vifacilita/redux/app_state.dart';

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  debugPrint('${DateTime.now()}: $action');
  next(action);
}
