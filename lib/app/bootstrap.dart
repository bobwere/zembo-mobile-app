import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zembo_agent_app/core/config/app_bloc_observer.dart';
import 'package:zembo_agent_app/injection.dart';

/* 
bootstrap the app here can do any pre app initialization required
like configuring dependency injection, log errors, setup sentry, set up 
mixpanel, setup event bus etc
*/
Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  String env,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  // configure dependenices
  configureDependencies(env);

  await Hive.initFlutter();

  // set orientation to portrait only
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }

  Bloc.observer = const AppBlocObserver();

  // log errors
  FlutterError.onError = (details) {
    debugPrint('Caught error: ${details.exceptionAsString()}');
  };

  // set orientation to portrait only
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );

  final app = await builder();

  runApp(app);
}
