import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wine/app.dart';

void main() {
  runZonedGuarded(() async {
    await _binding;

    FlutterError.onError = (details) => _onError('💥 Internal FlutterError', details: details);

    runApp(const App());
  }, (error, stackTrace) => _onError('💥 External ZoneError', error: error, stackTrace: stackTrace));
}

/// initialize widget binding
Future<void> get _binding async {
  WidgetsFlutterBinding.ensureInitialized();
}

void _onError(String description, {FlutterErrorDetails? details, Object? error, StackTrace? stackTrace}) {
  log('$description $details', name: 'main', error: error, stackTrace: stackTrace);
}
